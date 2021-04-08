// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../model/Data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    json['user_id'] as int,
    json['start_time'] == null
        ? null
        : DateTime.parse(json['start_time'] as String),
    json['end_time'] == null ? null : DateTime.parse(json['end_time'] as String),
    (json['round_log'] as List)
        ?.map((e) => (e as Map<String, dynamic>)?.map(
              (k, e) => MapEntry(k, (e as num)?.toDouble()),
            ))
        ?.toList(),
    json['round_mark'] as String,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'user_id': instance.userID,
      'round_log': instance.roundLog,
      'round_mark': instance.roundMark,
      'start_time': instance.startTime?.toIso8601String(),
      'end_time': instance.endTime?.toIso8601String(),
    };
