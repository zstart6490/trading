// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cash_in_create_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CashInCreateModelDTO _$CashInCreateModelDTOFromJson(
        Map<String, dynamic> json) =>
    CashInCreateModelDTO(
      json['transactionId'] as String?,
      (json['amount'] as num?)?.toDouble(),
      (json['feeAmount'] as num?)?.toDouble(),
      (json['paymentMethod'] as List<dynamic>?)
          ?.map((e) => PaymentMethodModelDTO.fromJson(e))
          .toList(),
    );

Map<String, dynamic> _$CashInCreateModelDTOToJson(
        CashInCreateModelDTO instance) =>
    <String, dynamic>{
      'transactionId': instance.transactionId,
      'amount': instance.amount,
      'feeAmount': instance.feeAmount,
      'paymentMethod': instance.paymentMethod,
    };

PaymentMethodModelDTO _$PaymentMethodModelDTOFromJson(
        Map<String, dynamic> json) =>
    PaymentMethodModelDTO(
      title: json['title'] as String?,
      note: json['note'] as String?,
      introduce: json['introduce'] as String?,
      key: json['key'] as String?,
    );

Map<String, dynamic> _$PaymentMethodModelDTOToJson(
        PaymentMethodModelDTO instance) =>
    <String, dynamic>{
      'title': instance.title,
      'note': instance.note,
      'introduce': instance.introduce,
      'key': instance.key,
    };
