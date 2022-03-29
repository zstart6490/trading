// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockModelDTO _$StockModelDTOFromJson(Map<String, dynamic> json) =>
    StockModelDTO(
      (json['total'] as num?)?.toDouble(),
      (json['stockBalance'] as num?)?.toDouble(),
      (json['cashBalance'] as num?)?.toDouble(),
      (json['interest'] as num?)?.toDouble(),
      (json['pendingCashIn'] as num?)?.toDouble(),
      (json['pendingCashOut'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$StockModelDTOToJson(StockModelDTO instance) =>
    <String, dynamic>{
      'total': instance.total,
      'stockBalance': instance.stockBalance,
      'cashBalance': instance.cashBalance,
      'interest': instance.interest,
      'pendingCashIn': instance.pendingCashIn,
      'pendingCashOut': instance.pendingCashOut,
    };
