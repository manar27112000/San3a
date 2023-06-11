class RegisterModel {
  bool? status;
  String? message;
  Data? data;
  String? token;
  RegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  String? id;
  String? image ;
  String? fullname;
  String? password;
  String? passwordConfirm;
  String? email;
  String? phone;
  String? birthdate;

  String? city;
  String? national_id;
  String? role;
  String? job_title;
  String? description;
  String? NidImage;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    image = json['photo'];
    fullname = json['name'];
    email = json['email'];
    password=json['password'];
    passwordConfirm=json['passwordConfirm'];
    phone = json['phone'];
    birthdate = json['birthdate'];
    national_id = json['national_id'];
    role = json['role'];
    job_title = json['job'];
    description = json['bio'];
    NidImage = json['photo_id'];
  }
}
