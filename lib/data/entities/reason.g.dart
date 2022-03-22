// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reason.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReasonDto _$ReasonDtoFromJson(Map<String, dynamic> json) => ReasonDto(
      id: json['id'] as int?,
      reason: json['content'] as String?,
    );

Map<String, dynamic> _$ReasonDtoToJson(ReasonDto instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.reason,
    };
