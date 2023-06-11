class MessageModel {
  bool? status;
  String? message;
  List<Data>? data;



  MessageModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
      });
    }
  }


}

class Data {
  String? sId;
  String? sender;
  String? text;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? time;
  String? date;


  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    sender = json['sender'];
    text = json['text'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    time = json['time'];
    date = json['date'];
  }


}
