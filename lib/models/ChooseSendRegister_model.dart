class ChooseSendRegister_model {
  late bool status;
  late  String message;

  ChooseSendRegister_model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];

  }
}