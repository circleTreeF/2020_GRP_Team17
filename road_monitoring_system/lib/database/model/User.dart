import 'dart:convert';

///This class is used to create [POST] for the users to login or register.
class User {
  ///[username] enters by the users when login in or register.
  String username;
  ///[password] enters by the users when login in ir register.
  String password;
  

  User({
    this.username,
    this.password
  });

  /**
  *** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
  *** @date: 2021/3/2 7:45 PM
  *** @version:1.0
  **/
  ///Converts json to [User].
  factory User.fromJson(Map<String, dynamic> json) => new User(
      username: json["username"],
      password: json["password"]
  );

  /**
  *** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
  *** @date: 2021/3/2 7:45 PM
  *** @version:1.0
  **/
  ///Converts [User] to json.
  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
  };
}

/**
*** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
*** @date: 2021/3/2 7:46 PM
*** @version:1.0
**/
///Converts json string to [User].
User userFromJson(String str) {
  final jsonData = json.decode(str);
  return User.fromJson(jsonData);
}

/**
*** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
*** @date: 2021/3/2 7:46 PM
*** @version:
**/
///Converts [User] to json.
String userToJson(User data) {
  final dataToJson = data.toJson();
  final dataToJson1=json.encode(dataToJson);
  return dataToJson1;
}





