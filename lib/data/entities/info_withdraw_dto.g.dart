// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_withdraw_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoWithdraw _$InfoWithdrawFromJson(Map<String, dynamic> json) => InfoWithdraw(
      transactionId: json['transactionId'] as String?,
      amount: json['amount'] as String?,
      linkId: json['linkId'] as String?,
      free: json['free'] as String?,
      finalAmount: json['finalAmount'] as String?,
      remainAmount: json['remainAmount'] as String?,
    );

Map<String, dynamic> _$InfoWithdrawToJson(InfoWithdraw instance) =>
    <String, dynamic>{
      'transactionId': instance.transactionId,
      'amount': instance.amount,
      'linkId': instance.linkId,
      'free': instance.free,
      'finalAmount': instance.finalAmount,
      'remainAmount': instance.remainAmount,
    };
