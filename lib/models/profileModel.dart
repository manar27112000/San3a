

class ProfileModel {
  bool? status;
  Data? data;



  ProfileModel.fromJson(Map<String, dynamic> json) {
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
  String? email;
  String? photo;
  String? role;
  String? birthdate;
  String? city;
  int? rateAverage;
  String? countryCode;
  String? id;

  UserData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    photo = json['photo'];
    role = json['role'];
    birthdate = json['birthdate'];
    city = json['city'];
    rateAverage = json['rateAverage'];
    countryCode = json['countryCode'];
    id = json['id'];
  }


}

class Posts {
  String? sId;
  User? user;
  String? description;
  Null? image;
  String? job;
  String? createdAt;
  String? updatedAt;
  String? date;
  String? id;

  Posts.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    description = json['description'];
    image = json['image'];
    job = json['job'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    date = json['Date'];
    id = json['id'];
  }


}

class User {
  String? sId;
  String? name;
  String? photo;
  String? role;
  String? id;



  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    photo = json['photo'];
    role = json['role'];
    id = json['id'];
  }


}
