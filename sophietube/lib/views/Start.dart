import 'package:flutter/material.dart';
import 'package:sophietube/Api/Api.dart';
import 'package:sophietube/models/Video.dart';

class Start extends StatefulWidget {
  String search;
  Start(this.search);
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {

  Api api = Api();
  Future<List<Video>> _listVideos(String search) async{
    return await api.search(search);
  }

  @override
  Widget build(BuildContext context) => FutureBuilder<List<Video>>(
      future: _listVideos(""),
      builder: (context, snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.none:
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
                    List<Video> videos = snapshot.data;
                    Video video = videos[ind];
                    return Column(
                      children: <Widget>[
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(video.image),
                            )
                          ),
                        ),
                        ListTile(
                          title: Text(video.title),
                          subtitle: Text(video.channel),
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
            else
            {

            }
        }
        return Container();
      },
  );
}