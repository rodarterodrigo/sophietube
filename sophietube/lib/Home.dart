import 'package:flutter/material.dart';
import 'package:sophietube/navigation/Navigation.dart';
import 'package:sophietube/navigation/NavigationBloc.dart';
import 'package:sophietube/search/CustomSearchDelegate.dart';

class Home extends StatefulWidget {
  String search;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Navigation navigation = Navigation();
  NavigationBloc navBloc = NavigationBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: navBloc.output,
      builder: (context, snapshot){
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
                  navBloc.inputSearch(res);
                },
              ),
            ],
          ),
          body: Container(
            padding: EdgeInsets.all(16),
            child: navigation.viewList(navBloc.currentInd, navBloc.search),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: navBloc.currentInd,
            onTap: (ind) => navBloc.inputAdd(ind),
            type: BottomNavigationBarType.shifting,
            fixedColor: Colors.white,
            items: navigation.bottonNavigation(),
          ),
        );
      },
    );
  }
  @override
  void dispose() {
    navBloc.dispose();
    super.dispose();
  }
}