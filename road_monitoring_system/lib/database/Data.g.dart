// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    json['user_id'] as int,
    json['start_time'] == null
      ? null
      : DateTime.parse(json['start_time'] as String),
    json['end_time'] == null
        ? null
        : DateTime.parse(json['end_time'] as String),
    (json['round_log'] as List)
        ?.map((e) => (e as Map<String, dynamic>)?.map(
              (k, e) => MapEntry(k, (e as num)?.toDouble()),
            ))
        ?.toList(),
    json['round_mark'] as String,

  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'user_id': instance.user_id,
  'start_time': instance.start_time?.toIso8601String(),
  'end_time': instance.end_time?.toIso8601String(),
      'round_log': instance.round_log,
      'round_mark': instance.round_mark,

    };
