// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_withdraw_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoWithdrawDto _$InfoWithdrawDtoFromJson(Map<String, dynamic> json) =>
    InfoWithdrawDto(
      transactionId: json['transactionId'] as int?,
      amount: json['amount'] as num?,
      linkId: json['linkId'] as String?,
      balance: json['balance'] as num?,
      feeAmount: json['feeAmount'] as num?,
      finalAmount: json['finalAmount'] as num?,
      remainAmount: json['remainAmount'] as num?,
    );

Map<String, dynamic> _$InfoWithdrawDtoToJson(InfoWithdrawDto instance) =>
    <String, dynamic>{
      'transactionId': instance.transactionId,
      'linkId': instance.linkId,
      'amount': instance.amount,
      'feeAmount': instance.feeAmount,
      'balance': instance.balance,
      'finalAmount': instance.finalAmount,
      'remainAmount': instance.remainAmount,
    };
