import 'package:flutter_app/database/User.dart';

class UserList {
  final List<User> users;

  UserList(this.users);

  factory UserList.fromJson(List<dynamic> parsedJson) {
    // ignore: deprecated_member_use
    List<User> users = new List<User>();
    users = parsedJson.map((i) => User.fromJson(i)).toList();
    return new UserList(users);
  }
}
