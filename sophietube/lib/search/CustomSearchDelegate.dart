import 'package:flutter/material.dart';

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
    List<String> list = List();
    if(query.isNotEmpty){
      list = [
        "Android", "navegação", "IOS", "Games"
      ].where((element) => element.toLowerCase().startsWith(query.toLowerCase())).toList();
      return ListView.builder(
          itemBuilder: (context, ind){
            return ListTile(
              onTap: (){
                close(context, list[ind]);
              },
              title: Text(
                list[ind],
              ),
            );
          },
        itemCount: list.length,
      );
    }
    else{
      return Center(
        child: Text(
          "Nenhum resultado para a pesquisa."
        ),
      );
    }
  }
}