class forget_password_model {
  late bool status;
  String? message;
  String? token;
  Data? data;
  forget_password_model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    // data = json['data'];
    // data == null ? null : UserData.fromJson(json['data']);
    //data = ((json['data'] = UserData.fromJson(json['data'])));
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    // json['data'] == null ? null : UserData.fromJson(json['data']);
  }
}

class Data {
 // late int id;
 // String? name;
  late String email;
  late String phone;
 // late String image;
 // late int points;
 // late int credit;
  // late String token;
  Data(
    //  this.id,
      //this.name,
      this.email,
      this.phone,
      //this.image,
      //this.points,
      //this.credit,
      //this.token,
      );
  Data.fromJson(Map<String, dynamic> json) {
    //id = json['id'];
   // name = json['name'];
    email = json['email'];
    phone = json['phone'];
   // image = json['image'];
    //points = json['points'];
    //credit = json['credit'];
    //token = json['token'];
  }
}