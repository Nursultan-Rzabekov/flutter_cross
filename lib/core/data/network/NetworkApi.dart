import 'dart:convert';

import 'package:fluttercross/core/models/Member.dart';
import 'package:fluttercross/core/models/MovieSearchResponse.dart';
import 'package:fluttercross/core/models/comment.dart';
import 'package:fluttercross/core/models/post.dart';
import 'package:fluttercross/core/models/user.dart';
import 'package:http/http.dart';

import 'Network.dart';

const String apiUrl = 'https://api.github.com/orgs/raywenderlich/members';
const String catImageAPIURL = 'https://api.thecatapi.com/v1/images/search?';
const endpoint = 'https://jsonplaceholder.typicode.com';
const String baseUrl = 'www.omdbapi.com';


class NetworkAPI {
  final String apiKey;
  NetworkAPI(this.apiKey);

  Future<MovieSearchResponse> findMovies(String query) async {
    final uri = Uri.http(baseUrl, '', {
      's': query.trim(),
      'apiKey': apiKey,
    });
    final response = await get('$uri');
    return movieSearchResponseFromJson(response.body);
  }

  Future<List<Member>> getRequest() async {
    var members = List<Member>();
    Network network = Network('$apiUrl');
    var data = await network.getData();
    Iterable list = json.decode(data);
    members = list.map((model) => Member.fromJson(model)).toList();
    return members;
  }

  Future<dynamic> getCatBreed(String breedName) async {
    Network network = Network('$catImageAPIURL');
    var catData = await network.getData();
    return catData;
  }

  Future<User> getUserProfile(int userId) async {
    // Get user profile for id
    Network network = Network('$endpoint/users/$userId');
    var response = await network.getData();
    // Convert and return
    return User.fromJson(json.decode(response.body));
  }

  Future<List<Post>> getPostsForUser(int userId) async {
    var posts = List<Post>();
    // Get user posts for id
    Network network = Network('$endpoint/posts?userId=$userId');
    var response = await network.getData();
    // parse into List
    var parsed = json.decode(response.body) as List<dynamic>;
    // loop and convert each item to Post
    for (var post in parsed) {
      posts.add(Post.fromJson(post));
    }
    return posts;
  }

  Future<List<Comment>> getCommentsForPost(int postId) async {
    var comments = List<Comment>();
    Network network = Network('$endpoint/comments?postId=$postId');
    // Get comments for post
    var response = await network.getData();
    // Parse into List
    var parsed = json.decode(response.body) as List<dynamic>;
    // Loop and convert each item to a Comment
    for (var comment in parsed) {
      comments.add(Comment.fromJson(comment));
    }
    return comments;
  }
}