class ResetPassword_model {
  late bool status;
  String? message;
  String? token;
  Data? data;
  ResetPassword_model.fromJson(Map<String, dynamic> json) {
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
  String? pass;
  String? confirmpass;
   late String token;
  Data(
      this.pass,
      this.confirmpass,
      this.token,
      );
  Data.fromJson(Map<String, dynamic> json) {
    pass = json['pass'];
    confirmpass = json['confirmpass'];
    token = json['token'];
  }
}