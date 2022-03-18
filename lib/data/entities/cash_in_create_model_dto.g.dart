// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cash_in_create_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CashInCreateModelDTO _$CashInCreateModelDTOFromJson(
        Map<String, dynamic> json) =>
    CashInCreateModelDTO(
      json['transactionId'] as String?,
      json['amount'] as int?,
      json['feeAmount'] as int?,
    );

Map<String, dynamic> _$CashInCreateModelDTOToJson(
        CashInCreateModelDTO instance) =>
    <String, dynamic>{
      'transactionId': instance.transactionId,
      'amount': instance.amount,
      'feeAmount': instance.feeAmount,
    };
