import 'package:flutter/widgets.dart';
import 'package:fluttercross/core/data/local/Storage.dart';
import 'package:fluttercross/core/data/network/NetworkApi.dart';

class BaseModel extends ChangeNotifier {

  BaseModel(this._networkRepository, this._storage);

  final NetworkAPI _networkRepository;
  final Storage _storage;

  NetworkAPI get networkRepository => _networkRepository;
  Storage get storage => _storage;

  void refresh() {
    notifyListeners();
  }
}
