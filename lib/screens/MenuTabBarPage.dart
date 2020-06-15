import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercross/screens/MoviesListPage.dart';

class MenuTabBarPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _TabBarPageState();
}


class _TabBarPageState extends State<MenuTabBarPage> {
  final controller = TextEditingController();
  String _query;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
          title: Text('Tabs Demo'),
        ),
        body: TabBarView(
          children: [
            MoviesListPage(),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}