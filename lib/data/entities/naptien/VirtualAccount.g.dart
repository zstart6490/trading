// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VirtualAccount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VirtualAccount _$VirtualAccountFromJson(Map<String, dynamic> json) =>
    VirtualAccount(
      json['id'] as int,
      json['uname'] as String,
      json['account_no'] as String,
      json['account_name'] as String,
      json['account_address'] as String,
      json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$VirtualAccountToJson(VirtualAccount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uname': instance.userName,
      'account_no': instance.accountNo,
      'account_name': instance.accountName,
      'account_address': instance.accountAddress,
      'created_at': instance.createdAt?.toIso8601String(),
    };
