// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_history_price_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockHistoryPriceModelDTO _$StockHistoryPriceModelDTOFromJson(
        Map<String, dynamic> json) =>
    StockHistoryPriceModelDTO(
      json['TradingDate'] as String?,
      (json['Open'] as num?)?.toDouble(),
      (json['Close'] as num?)?.toDouble(),
      (json['High'] as num?)?.toDouble(),
      (json['Low'] as num?)?.toDouble(),
      (json['Volume'] as num?)?.toDouble(),
      (json['Value'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$StockHistoryPriceModelDTOToJson(
        StockHistoryPriceModelDTO instance) =>
    <String, dynamic>{
      'TradingDate': instance.tradingDate,
      'Open': instance.open,
      'Close': instance.close,
      'High': instance.high,
      'Low': instance.low,
      'Volume': instance.volume,
      'Value': instance.value,
    };
