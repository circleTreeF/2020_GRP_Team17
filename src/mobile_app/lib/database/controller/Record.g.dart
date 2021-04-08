// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../model/Record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Record _$RecordFromJson(Map<String, dynamic> json) {
  return Record(
    json['start_time'] as String,
    json['end_time'] as String,
    json['round_mark'] as String,
  );
}

Map<String, dynamic> _$RecordToJson(Record instance) => <String, dynamic>{
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'round_mark': instance.roundMark,
    };
