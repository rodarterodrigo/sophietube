import 'package:flutter/material.dart';
import 'package:sophietube/models/Sugestion.dart';

class SearchHelper implements SearchDelegate{

  String _verifyConection = "Verifique sua conexão.";
  String _dataFail = "Não foi possível retornar dados.";
  String _noResult = "Nenhum resultado para a pesquisa.";

  Widget noResult(){
    return Center(
      child: Text(
        _noResult,
        style: TextStyle(
            fontSize: 20
        ),
      ),
    );
  }

  Widget helpSnapShot(BuildContext context, AsyncSnapshot snapshot) {
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
  }
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}