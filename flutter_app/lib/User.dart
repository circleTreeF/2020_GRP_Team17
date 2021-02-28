
import 'package:json_annotation/json_annotation.dart';
part 'User.g.dart';
@JsonSerializable()
class User extends Object {

  final String startTime;

  User(this.startTime, this.endTime, this.roundMark);

  final String endTime;

  final double roundMark;



  @override
  String toString() {
    return 'User{start_time: $startTime, end_time: $endTime, round_mark: $roundMark}';
  }
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson(User instance) => _$UserToJson(instance);
  void printMap(var _user) {
    print(_user);
}

}