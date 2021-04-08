import 'dart:convert';

///This class is used to create POST for the users to login or register.
class User {
  ///The [username] enters by the users when login in or register.
  String username;
  ///The [password] enters by the users when login in or register.
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
  ///Converts [JSON] data format to [User] object.
  factory User.fromJson(Map<String, dynamic> json) => new User(
      username: json["username"],
      password: json["password"]
  );

  /**
  *** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
  *** @date: 2021/3/2 7:45 PM
  *** @version:1.0
  **/
  ///Converts User object to JSON data format.
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
///Converts JSON data format string to User object.
User userFromJson(String str) {
  final jsonData = json.decode(str);
  return User.fromJson(jsonData);
}

/**
*** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
*** @date: 2021/3/2 7:46 PM
*** @version:
**/
///Converts User object to JSON format data.
String userToJson(User data) {
  final dataToJson = data.toJson();
  final dataToJson1=json.encode(dataToJson);
  return dataToJson1;
}





