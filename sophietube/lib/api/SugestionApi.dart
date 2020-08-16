import 'package:http/http.dart' as http;
import 'package:sophietube/models/Sugestion.dart';
import 'dart:convert';

const YOUTUBE_API_KEY = "AIzaSyBMBJ4gIGKsmq4DsS4CPb52Z4wkZ8zeeYs";
const CHANNEL_KEY = "UCuVIWETFdxzwlHEHMbhm2_w";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class SugestionApi{

  Future<List<Sugestion>> search(String search) async{
    if (search == null)
      search = "";
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
      return jsonData["items"].map<Sugestion>((map) => Sugestion.fromJson(map)).toList();
    }
    //print(response.body);
  }
}