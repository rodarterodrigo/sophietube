import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
          opacity: 1,
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
          "Images/youtube.png",
          width: 100,
          height: 24,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: (){
              print("ação: videocam");
            },

          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              print("ação: pesquisa");
            },

          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: (){
              print("ação: conta");
            },
          ),
        ],
      ),
      body: Container(

      ),
    );
  }
}
