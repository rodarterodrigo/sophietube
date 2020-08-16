import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sophietube/models/Video.dart';

const YOUTUBE_API_KEY = "AIzaSyBMBJ4gIGKsmq4DsS4CPb52Z4wkZ8zeeYs";
const CHANNEL_KEY = "UCuVIWETFdxzwlHEHMbhm2_w";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api{

  search(String search) async{

    http.Response response = await http.get(
        URL_BASE + "search"
            "?part=snippet"
            "&channelId=${CHANNEL_KEY}"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=${YOUTUBE_API_KEY}"
            "&q=${search}"
    );

    if(response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);
      List<Video> videos = jsonData["items"].map<Video>(
          (map) => Video.fromJson(map),
      );
//      for(var v in jsonData["items"]){
//        print("resultado: " + v.toString());
//      }
    }
  }
}