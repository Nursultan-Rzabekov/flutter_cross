import 'package:flutter/material.dart';
import 'package:fluttercross/data/network/OMDBClient.dart';
import '../data/local/Storage.dart';

class MovieTrackerApp with ChangeNotifier {
  MovieTrackerApp(this._movieRepository, this._storage);

  final OMDBClient _movieRepository;
  final Storage _storage;

  OMDBClient get movieRepository => _movieRepository;

  Storage get storage => _storage;

  void refresh() {
    notifyListeners();
  }
}
