import 'package:flutter/material.dart';
import 'package:sophietube/views/HotAndNews.dart';
import 'package:sophietube/views/Library.dart';
import 'package:sophietube/views/Start.dart';
import 'package:sophietube/views/Subscriptions.dart';

class Navigation{
  Widget viewList(int ind) {
    List<Widget> views = [
      Start(),
      HotAndNews(),
      Subscriptions(),
      Library(),
    ];
    return views[ind];
  }
}