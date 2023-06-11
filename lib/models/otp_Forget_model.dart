class otp_Forget_model{
  late bool status;
  String? message;
  String? token;
  otp_Forget_model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
  }
}

