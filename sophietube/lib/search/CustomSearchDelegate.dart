import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String>{
  @override
  List<Widget> buildActions(BuildContext context) {
    return[
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){

        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return Container(

    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(

    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(

    );
  }
  
}