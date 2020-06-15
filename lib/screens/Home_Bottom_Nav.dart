import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercross/screens/MoviesListPage.dart';

import 'GHFlutterState.dart';
import '../model/Strings.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home>{
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeWidget(),
    MoviesListPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appTitle),

      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text(Strings.home)
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.mail),
              title: new Text(Strings.messages)
          )
        ],
      ),
    );
  }

  void onTabTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }
}
