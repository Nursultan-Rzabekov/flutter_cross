import 'package:flutter/material.dart';
import 'package:fluttercross/core/data/network/NetworkApi.dart';
import 'package:fluttercross/core/viewmodels/base_model.dart';
import 'package:fluttercross/screens/AddMoviePage.dart';
import 'package:fluttercross/screens/GHFlutterState.dart';
import 'package:fluttercross/screens/Home_Bottom_Nav.dart';
import 'package:fluttercross/extension/Strings.dart';
import 'package:fluttercross/screens/ItemDetailPage.dart';
import 'package:fluttercross/screens/MoviesListPage.dart';
import 'package:provider/provider.dart';
import 'core/data/local/DatabasePersistence.dart';
import 'core/data/local/Storage.dart';
import 'core/models/Movie.dart';


void main() {
  runApp(GHFlutterApp());
}

class GHFlutterApp extends StatelessWidget {
  static const apiKey = 'ff6dee5d';
  static var provider = BaseModel(NetworkAPI(apiKey), null);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Storage>(
        future: Storage.createFrom(
          future: DatabasePersistence.create(),
        ),
        builder: (context, snapshot) {
          final repository = snapshot.data;
          provider = BaseModel(NetworkAPI(apiKey), repository);
          return MultiProvider(
              providers: [ChangeNotifierProvider.value(value: provider)],
              child: MaterialApp(
                title: Strings.appTitle,
                theme: ThemeData(primaryColor: Colors.green.shade800),
                home: Home(),
                onGenerateRoute: (settings) {
                  return MaterialPageRoute(
                    builder: (context) {
                      return _makeRoute(
                          context: context,
                          routeName: settings.name,
                          arguments: settings.arguments);
                    },
                    maintainState: true,
                    fullscreenDialog: false,
                  );
                },
              )
          );
        });
  }

  Widget _makeRoute(
      {@required BuildContext context,
        @required String routeName,
        Object arguments}) {
    final Widget child = _buildRoute(
      context: context,
      routeName: routeName,
      arguments: arguments,
    );
    return child;
  }

  Widget _buildRoute({
    @required BuildContext context,
    @required String routeName,
    Object arguments,
  }) {
    switch (routeName) {
      case '/list':
        return MultiProvider(
          providers: [
            ChangeNotifierProvider.value(
              value: provider,
            )
          ],
          child: MoviesListPage(),
        );
      case '/filter':
        return MultiProvider(
          providers: [
            ChangeNotifierProvider.value(
              value: provider,
            )
          ],
          child: MoviesListPage(),
        );
      case '/stats':
        return MultiProvider(
          providers: [
            ChangeNotifierProvider.value(
              value: provider,
            )
          ],
          child: MoviesListPage(),
        );
      case '/details':
        final map = arguments as Map<String, dynamic> ?? Map();
        final item = map['item'] as Movie;

        return MultiProvider(
          providers: [
            ChangeNotifierProvider.value(
              value: provider,
            )
          ],
          child: ItemDetailPage(item: item),
        );
      case '/add':
        return MultiProvider(
          providers: [
            ChangeNotifierProvider.value(
              value: provider,
            )
          ],
          child: AddMoviePage(),
        );
      case '/flutterState':
        return MultiProvider(
          providers: [
            ChangeNotifierProvider.value(
              value: provider,
            )
          ],
          child: HomeWidget(),
        );
      default:
        return Container();
    }
  }
}




