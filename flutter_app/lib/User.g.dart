// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['startTime'] as String,
    json['endTime'] as String,
    (json['roundMark'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'roundMark': instance.roundMark,
    };
