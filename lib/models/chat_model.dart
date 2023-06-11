class ChatModel {
  bool? status;
  String? message;
  String? loginId;
  List<Data>? data;


  ChatModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    loginId = json['loginId'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

}

class Data {
  String? sId;
  To? to;
  From? from;
  LatestMessage? latestMessage;
  int? iV;

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    to = json['to'] != null ? new To.fromJson(json['to']) : null;
    from = json['from'] != null ? new From.fromJson(json['from']) : null;
    latestMessage = json['latestMessage'] != null
        ? new LatestMessage.fromJson(json['latestMessage'])
        : null;
    iV = json['__v'];
  }


}

class To {
  String? sId;
  String? name;
  String? photo;
  String? id;

  To.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    photo = json['photo'];
    id = json['id'];
  }


}
class From {
  String? sId;
  String? name;
  String? photo;
  String? id;

  From.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    photo = json['photo'];
    id = json['id'];
  }


}

class LatestMessage {
  String? sId;
  String? text;

  String? time;
  String? date;


  LatestMessage.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    text = json['text'];
    time = json['time'];
    date = json['date'];
  }


}
