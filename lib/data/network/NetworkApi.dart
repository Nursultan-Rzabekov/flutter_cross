import 'Network.dart';

const String apiUrl = 'https://api.github.com/orgs/raywenderlich/members';
const String catImageAPIURL = 'https://api.thecatapi.com/v1/images/search?';

class NetworkAPI {

  Future<dynamic> getRequest() async {
    Network network = Network('$apiUrl');
    var data = await network.getData();
    return data;
  }

  Future<dynamic> getCatBreed(String breedName) async {
    Network network =
    Network('$catImageAPIURL');
    var catData = await network.getData();
    return catData;
  }
}