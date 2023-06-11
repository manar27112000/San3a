class SendMessage {
  bool? status;
  String? message;
  Data? data;



  SendMessage.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }


}

class Data {
  String? sender;
  Content? content;
  String? time;


  Data.fromJson(Map<String, dynamic> json) {
    sender = json['sender'];
    content =
    json['content'] != null ? new Content.fromJson(json['content']) : null;
    time = json['time'];
  }

}

class Content {
  String? text;
  Null? image;



  Content.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    image = json['image'];
  }


}
