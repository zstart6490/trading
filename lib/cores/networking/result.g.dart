// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      success: json['success'] as bool,
      code: json['code'] as int,
      msg: json['msg'] as String,
      data: json['data'],
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'data': instance.data,
      'msg': instance.msg,
    };
