import 'package:flutter/material.dart';
import 'package:sophietube/api/SugestionApi.dart';
import 'package:sophietube/models/Sugestion.dart';
import 'package:sophietube/search/SearchHelper.dart';

class CustomSearchDelegate extends SearchDelegate<String>{
  @override
  // TODO: implement searchFieldLabel
  String get searchFieldLabel => "Busca";
  @override
  List<Widget> buildActions(BuildContext context)
    => [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = "";
        },
      ),
    ];

  @override
  Widget buildLeading(BuildContext context)
    => IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: (){
          close(context, "");
        },
      );

  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    SearchHelper searchHelper = new SearchHelper();
    if(query.isNotEmpty){

      SugestionApi api = SugestionApi();
      Future<List<Sugestion>> _listSugestions(String search) async => await api.search(search);

      return FutureBuilder<List<Sugestion>>(
        future: _listSugestions(query),
        builder: (context, snapshot) => searchHelper.helpSnapShot(context, snapshot)
      );
    }
    else
    {
      return searchHelper.noResult();
    }
  }
}