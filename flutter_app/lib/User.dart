
import 'package:json_annotation/json_annotation.dart';
part 'User.g.dart';
@JsonSerializable()
class User extends Object {

  final String start_time;

  User(this.start_time, this.end_time, this.round_mark);

  final String end_time;

  final double round_mark;



  @override
  String toString() {
    return 'User{start_time: $start_time, end_time: $end_time, round_mark: $round_mark}';
  }
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson(User instance) => _$UserToJson(instance);
  void printMap(var _user) {
    print(_user);
}
}