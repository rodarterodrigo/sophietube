import 'package:flutter/material.dart';
import 'package:sophietube/views/HotAndNews.dart';
import 'package:sophietube/views/Library.dart';
import 'package:sophietube/views/Start.dart';
import 'package:sophietube/views/Subscriptions.dart';

class Navigation{

  Widget viewList(int ind, String search) {
    List<Widget> views = [
      Start(search),
      HotAndNews(),
      Subscriptions(),
      Library(),
    ];
    return views[ind];
  }

  List<BottomNavigationBarItem> bottonNavigation()
      => [
      BottomNavigationBarItem(
        backgroundColor: Colors.red,
        title: Text(
          "Início",
        ),
        icon: Icon(Icons.home),
      ),
      BottomNavigationBarItem(
        backgroundColor: Colors.blue,
        title: Text(
          "Em alta",
        ),
        icon: Icon(Icons.whatshot),
      ),
      BottomNavigationBarItem(
        backgroundColor: Colors.amber,
        title: Text(
          "Inscrições",
        ),
        icon: Icon(Icons.subscriptions),
      ),
      BottomNavigationBarItem(
        backgroundColor: Colors.green,
        title: Text(
          "Biblioteca",
        ),
        icon: Icon(Icons.video_library),
      ),
    ];
}