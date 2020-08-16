class Video {

  String _id;
  String _title;
  String _description;
  String _image;
  String _channel;

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  Video(this._id, this._title, this._description, this._image, this._channel);

  Video.fromJson(Map<String, dynamic> json){}

  String get title => _title;

  String get channel => _channel;

  set channel(String value) {
    _channel = value;
  }

  String get image => _image;

  set image(String value) {
    _image = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  set title(String value) {
    _title = value;
  }
}