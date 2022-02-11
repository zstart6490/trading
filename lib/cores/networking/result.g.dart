// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../cores/networking/result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      success: json['success'] as bool? ?? false,
      error: json['error'] == null
          ? null
          : Errors.fromJson(json['error'] as Map<String, dynamic>),
      message: json['message'] as String?,
      data: json['data'],
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'success': instance.success,
      'error': instance.error,
      'data': instance.data,
      'message': instance.message,
    };

Errors _$ErrorsFromJson(Map<String, dynamic> json) => Errors(
      json['code'] as int,
      json['message'] as String,
    );

Map<String, dynamic> _$ErrorsToJson(Errors instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
