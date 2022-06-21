// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockModelDTO _$StockModelDTOFromJson(Map<String, dynamic> json) =>
    StockModelDTO(
      json['symbol'] as String?,
      json['stockName'] as String?,
      json['imageUrl'] as String?,
      json['stockType'] as int?,
      (json['lastPrice'] as num?)?.toDouble(),
      (json['change'] as num?)?.toDouble(),
      (json['ratioChange'] as num?)?.toDouble(),
      (json['ceiling'] as num?)?.toDouble(),
      (json['floor'] as num?)?.toDouble(),
      (json['refPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$StockModelDTOToJson(StockModelDTO instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'stockName': instance.stockName,
      'imageUrl': instance.imageUrl,
      'stockType': instance.stockType,
      'lastPrice': instance.lastPrice,
      'change': instance.change,
      'ratioChange': instance.ratioChange,
      'ceiling': instance.ceiling,
      'floor': instance.floor,
      'refPrice': instance.refPrice,
    };
