// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockPrice _$StockPriceFromJson(Map<String, dynamic> json) => StockPrice(
      json['sym'] as String?,
      (json['prc'] as num?)?.toDouble(),
      (json['chg'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$StockPriceToJson(StockPrice instance) =>
    <String, dynamic>{
      'sym': instance.symbol,
      'prc': instance.price,
      'chg': instance.chg,
    };
