import 'dart:convert';

Post postFromJson(String str) {
  final jsonData = json.decode(str);
  return Post.fromJson(jsonData);
}

String postToJson(Post data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}


List<Post> allPostsFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<Post>.from(jsonData.map((x) => Post.fromJson(x)));
}

String allPostsToJson(List<Post> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class Post {
  int user_id;
  Post({
    this.user_id,
  });

  factory Post.fromJson(Map<String, dynamic> json) => new Post(
    user_id: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": user_id,
  };
}

class Post1 {
  String username;
  String password;
  bool results;
  Post1({
    this.username,
    this.password
  });

  factory Post1.fromJson(Map<String, dynamic> json) => new Post1(
    username: json["username"],

  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
  };
}

Post1 post1FromJson(String str) {
  final jsonData = json.decode(str);
  return Post1.fromJson(jsonData);
}

String post1ToJson(Post1 data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}


List<Post1> allPost1sFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<Post1>.from(jsonData.map((x) => Post1.fromJson(x)));
}

String allPost1sToJson(List<Post1> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}