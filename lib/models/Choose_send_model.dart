class choose_send_model {
  late bool status;
 late  String message;

  choose_send_model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];

  }
}

