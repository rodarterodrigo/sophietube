import 'package:flutter/material.dart';
import 'package:sophietube/navigation/Navigation.dart';
import 'package:sophietube/search/CustomSearchDelegate.dart';

class Home extends StatefulWidget {
  String search;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _result = "";
  Navigation navigation = Navigation();
  int _currentInd = 0;

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
            icon: Icon(Icons.search),
            onPressed: () async{
              String res = await showSearch(context: context, delegate: CustomSearchDelegate());
              setState(() {
                _result = res;
              });
            },
          ),
//          IconButton(
//            icon: Icon(Icons.videocam),
//            onPressed: (){
//            },
//          ),
//          IconButton(
//            icon: Icon(Icons.account_circle),
//            onPressed: (){
//            },
//          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: navigation.viewList(_currentInd, _result),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentInd,
        onTap: (ind){
          setState(() {
            _currentInd = ind;
          });
        },
        type: BottomNavigationBarType.shifting,
        fixedColor: Colors.white,
        items: [
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
        ],
      ),
    );
  }
}