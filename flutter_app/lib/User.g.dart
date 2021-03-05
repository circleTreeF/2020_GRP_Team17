// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['start_time'] as String,
    json['end_time'] as String,
    json['round_mark'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'start_time': instance.start_time,
      'end_time': instance.end_time,
      'round_mark': instance.round_mark,
    };
