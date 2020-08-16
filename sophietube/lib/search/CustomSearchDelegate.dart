import 'package:flutter/material.dart';
import 'package:sophietube/api/SugestionApi.dart';
import 'package:sophietube/models/Sugestion.dart';

class CustomSearchDelegate extends SearchDelegate<String>{
  @override
  List<Widget> buildActions(BuildContext context) {
    return[
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return
      IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: (){
          close(context, "");
        },
      );
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    SugestionApi sugestionApi = SugestionApi();


    if(query.isNotEmpty){
//      List<String> list = List();
      SugestionApi api = SugestionApi();
      Future<List<Sugestion>> _listSugestions(String search) async{
        return await api.search(search);
      }
//      list = [
//        "Android", "Navegação", "IOS", "Flutter"
//      ].where((element) => element.toLowerCase().startsWith(query.toLowerCase())).toList();
      return FutureBuilder<List<Sugestion>>(
        future: _listSugestions(query),
        builder: (context, snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
              return Center(
                child: Text(
                  "Verifique sua conexão.",
                  style: TextStyle(
                      fontSize: 25
                  ),
                ),
              );
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.active:
            case ConnectionState.done:
              if(snapshot.hasData){
                return ListView.separated(
                  itemBuilder: (context, ind){
                    List<Sugestion> sugestions = snapshot.data;
                    String title = sugestions[ind].title.startsWith(query, ind).toString();
                    return Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(title),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, ind) => Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                  itemCount: snapshot.data.length,
                );
              }
              else{
                return Center(
                  child: Text(
                    "Não foi possível retornar dados.",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                );
              }
              break;
          }
          return Container();
        },
      );
//      return ListView.builder(
//          itemBuilder: (context, ind){
//            return ListTile(
//              onTap: (){
//                close(context, list[ind]);
//              },
//              title: Text(
//                list[ind],
//              ),
//            );
//          },
//        itemCount: list.length,
//      );
    }
    else{
      return Center(
        child: Text(
          "Nenhum resultado para a pesquisa.",
          style: TextStyle(
            fontSize: 25
          ),
        ),
      );
    }
  }
}