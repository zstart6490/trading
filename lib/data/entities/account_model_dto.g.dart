// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountInfoModelDTO _$AccountInfoModelDTOFromJson(Map<String, dynamic> json) =>
    AccountInfoModelDTO(
      (json['total'] as num?)?.toDouble(),
      (json['stockBalance'] as num?)?.toDouble(),
      (json['cashBalance'] as num?)?.toDouble(),
      (json['interest'] as num?)?.toDouble(),
      (json['pendingCashIn'] as num?)?.toDouble(),
      (json['pendingCashOut'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AccountInfoModelDTOToJson(
        AccountInfoModelDTO instance) =>
    <String, dynamic>{
      'total': instance.total,
      'stockBalance': instance.stockBalance,
      'cashBalance': instance.cashBalance,
      'interest': instance.interest,
      'pendingCashIn': instance.pendingCashIn,
      'pendingCashOut': instance.pendingCashOut,
    };
