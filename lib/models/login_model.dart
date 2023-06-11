class LoginModel {
   late bool status;
   String? message;
    String? token;
   Error? error ;
   NotError? notError ;
  UserData? data;
  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
    notError = json['notError'] != null ? NotError.fromJson(json['notError']) : null;

  }
}

class UserData {
  late String name;
  late String photo;

  UserData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    photo = json['photo'];


  }
}

class Error {
  late int statusCode;
  Error.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
  }
}
class NotError {
  late int statusCode;
  NotError.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
  }
}