// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['start_time'] as String,
    json['end_time'] as String,
    (json['round_mark'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'startTime': instance.start_time,
      'endTime': instance.end_time,
      'roundMark': instance.round_mark,
    };
