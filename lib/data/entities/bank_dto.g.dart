// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBankDto _$UserBankDtoFromJson(Map<String, dynamic> json) => UserBankDto(
      id: json['id'] as int?,
      userId: json['userId'] as String?,
      bankId: json['bankId'] as String?,
      bankBranchId: json['bankBranchId'] as String?,
      accountName: json['accountName'] as String?,
      accountNo: json['accountNo'] as String?,
      bank: json['bank'] == null ? null : BankDto.fromJson(json['bank']),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$UserBankDtoToJson(UserBankDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'bankId': instance.bankId,
      'bankBranchId': instance.bankBranchId,
      'accountName': instance.accountName,
      'accountNo': instance.accountNo,
      'bank': instance.bank,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

BankDto _$BankDtoFromJson(Map<String, dynamic> json) => BankDto(
      id: json['id'] as int?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      logo: json['logo'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$BankDtoToJson(BankDto instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'logo': instance.logo,
      'type': instance.type,
    };
