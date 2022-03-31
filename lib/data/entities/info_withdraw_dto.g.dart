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
      receiveAmount: json['receiveAmount'] as num?,
      remainingBalance: json['remainingBalance'] as num?,
    );

Map<String, dynamic> _$InfoWithdrawDtoToJson(InfoWithdrawDto instance) =>
    <String, dynamic>{
      'transactionId': instance.transactionId,
      'linkId': instance.linkId,
      'amount': instance.amount,
      'feeAmount': instance.feeAmount,
      'balance': instance.balance,
      'receiveAmount': instance.receiveAmount,
      'remainingBalance': instance.remainingBalance,
    };
