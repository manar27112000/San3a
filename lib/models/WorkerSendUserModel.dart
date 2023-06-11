
class WorkerSendUser {
  bool? status;
  Data? data;

  WorkerSendUser.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }


}

class Data {
  UserData? userData;
  List<Posts>? posts;


  Data.fromJson(Map<String, dynamic> json) {
    userData = json['userData'] != null
        ? new UserData.fromJson(json['userData'])
        : null;
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
  }


}

class UserData {
  String? sId;
  String? name;
  String? phone;
  String? email;
  String? photo;
  String? role;
  String? birthdate;
  String? city;
  String? nationalId;
  bool? active;
  List<Null>? rating;
  String? job;
  String? photoId;
  bool? ispaid;
  String? addresse;
  String? nationalFormat;
  String? internationalFormat;
  String? countryCode;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? id;



  UserData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    photo = json['photo'];
    role = json['role'];
    birthdate = json['birthdate'];
    city = json['city'];
    nationalId = json['national_id'];
    active = json['active'];
    job = json['job'];
    photoId = json['photo_id'];
    ispaid = json['ispaid'];
    addresse = json['addresse'];
    nationalFormat = json['nationalFormat'];
    internationalFormat = json['internationalFormat'];
    countryCode = json['countryCode'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    id = json['id'];
  }


}

class Posts {
  String? sId;
  User? user;
  String? description;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? date;
  String? time;
  String? id;



  Posts.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    description = json['description'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    date = json['Date'];
    time = json['Time'];
    id = json['id'];
  }


}

class User {
  String? sId;
  String? name;
  String? photo;
  String? id;



  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    photo = json['photo'];
    id = json['id'];
  }

}
