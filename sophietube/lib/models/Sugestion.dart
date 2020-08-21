class Sugestion {

  String id;
  String title;
  String description;
  String channel;

  Sugestion({this.id, this.title, this.description, this.channel});

  factory Sugestion.fromJson(Map<String, dynamic> json) => Sugestion(
      id: json["id"]["videoId"],
      title: json["snippet"]["title"],
      channel: json["snippet"]["channelTitle"],
      description: json["snippet"]["description"],
    );
}