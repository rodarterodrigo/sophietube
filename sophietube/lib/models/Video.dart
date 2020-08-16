class Video {

  String id;
  String title;
  String description;
  String image;
  String channel;


  Video({this.id, this.title, this.description, this.image, this.channel});

  static jsonConvert(Map<String, dynamic> json){
    return Video(
      id: json["id"]["videoId"],
      title: json["snippet"]["title"],
      channel: json["snippet"]["channelId"],
      description: json["snippet"]["description"],
      image: json["snippet"]["thumbnails"]["default"]["url"],
    );
  }

  Video.fromJson(Map<String, dynamic> json){
    return;
  }
}