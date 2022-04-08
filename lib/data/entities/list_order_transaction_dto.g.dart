// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_order_transaction_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListOrderTransactionDto _$ListOrderTransactionDtoFromJson(
        Map<String, dynamic> json) =>
    ListOrderTransactionDto(
      (json['records'] as List<dynamic>?)
          ?.map((e) => OrderRecordDto.fromJson(e))
          .toList(),
    );

Map<String, dynamic> _$ListOrderTransactionDtoToJson(
        ListOrderTransactionDto instance) =>
    <String, dynamic>{
      'records': instance.records,
    };

OrderRecordDto _$OrderRecordDtoFromJson(Map<String, dynamic> json) =>
    OrderRecordDto(
      json['key'] as String?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => StockTransactionDetailDto.fromJson(e))
          .toList(),
    );

Map<String, dynamic> _$OrderRecordDtoToJson(OrderRecordDto instance) =>
    <String, dynamic>{
      'key': instance.key,
      'data': instance.data,
    };
