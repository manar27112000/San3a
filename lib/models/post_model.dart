class PostModel{
  late int length;
  late List<PostData> postData ;
  PostModel.fromJson(Map<String , dynamic> json){
    length = json['length'];
    postData = [];
    json['data'].forEach((element){
      postData.add(PostData.fromJson(element));
    });
  }

}

class PostData{
  late String postId;
   String? image;
   String? textPost;
  late String job;
  late String dateOfPost;
  late userPost userDataPost;
  PostData.fromJson(Map<String, dynamic> json)
  {
    postId = json['_id'];
    image = json['image'];
    textPost = json['description'];
    job = json['job'];
    dateOfPost = json['Date'];
    userDataPost = userPost.fromJson(json['user']);
  }
}

class userPost
{
  late String id;
  late String name;
  late String photo;
  userPost.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
  }
}

