class findAccount_model {
  late bool status;
  String? message;
  String? token;
  Data? data;
  findAccount_model.fromJson(Map<String, dynamic> json) {
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
  late String email;
   late String phone;
  //late String token;
  Data(
      this.email,
    //  this.phone,
     // this.token,
      );
  Data.fromJson(Map<String, dynamic> json) {

    email = json['email'];
    phone = json['phone'];
    //token = json['token'];
  }
}