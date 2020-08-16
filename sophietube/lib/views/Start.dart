import 'package:flutter/material.dart';
import 'package:sophietube/Api/Api.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    Api api = Api();
//    api.search("");

    return Container(
      child: Center(
        child: Text(
          "Início",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
