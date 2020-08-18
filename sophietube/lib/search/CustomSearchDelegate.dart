import 'package:flutter/material.dart';
import 'package:sophietube/api/SugestionApi.dart';
import 'package:sophietube/models/Sugestion.dart';
import 'package:sophietube/search/SearchHelper.dart';

class CustomSearchDelegate extends SearchDelegate<String>{
  String _verifyConection = "Verifique sua conexão.";
  String _dataFail = "Não foi possível retornar dados.";

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
        builder: (context, snapshot){
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(
                child: Text(
                  _verifyConection,
                  style: TextStyle(
                      fontSize: 20
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
              if (snapshot.hasData) {
                return ListView.separated(
                  itemBuilder: (context, ind) {
                    List<Sugestion> sugestions = snapshot.data;
                    String title = sugestions[ind].title;
                    return Column(
                      children: <Widget>[
                        ListTile(
                          onTap: () => close(context, title),
                          title: Text(title),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, ind) =>
                      Divider(
                        height: 2,
                        color: Colors.grey,
                      ),
                  itemCount: snapshot.data.length,
                );
              }
              else {
                return Center(
                  child: Text(
                    _dataFail,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                );
              }
              break;
          }
          return Container();
        }
      );
    }
    else
    {
      return searchHelper.noResult();
    }
  }
}