import 'dart:async';

class NavigationBloc {
  int currentInd = 0;
  String search = "";
  final StreamController _streamController = StreamController.broadcast();
  Sink get input => _streamController.sink;
  Stream get output => _streamController.stream;

  void inputAdd(int ind){
    currentInd = ind;
    input.add(currentInd);
  }

  void inputSearch(String search){
    this.search = search;
    input.add(this.search);
  }
}