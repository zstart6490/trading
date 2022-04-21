// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_own_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductOwnDto _$ProductOwnDtoFromJson(Map<String, dynamic> json) =>
    ProductOwnDto(
      id: json['id'] as int?,
      productKey: json['productKey'] as String?,
      quantity: (json['quantity'] as num?)?.toDouble(),
      priceAvg: (json['priceAvg'] as num?)?.toDouble(),
      imageUrl: json['imageUrl'] as String?,
      catName: json['catName'] as String?,
      stockName: json['stockName'] as String?,
      symbol: json['symbol'] as String?,
      lastPrice: (json['lastPrice'] as num?)?.toDouble(),
      changePrice: (json['changePrice'] as num?)?.toDouble(),
      ratioChange: (json['ratioChange'] as num?)?.toDouble(),
      stockType: json['stockType'] as int?,
    );

Map<String, dynamic> _$ProductOwnDtoToJson(ProductOwnDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productKey': instance.productKey,
      'quantity': instance.quantity,
      'priceAvg': instance.priceAvg,
      'imageUrl': instance.imageUrl,
      'catName': instance.catName,
      'stockName': instance.stockName,
      'symbol': instance.symbol,
      'lastPrice': instance.lastPrice,
      'changePrice': instance.changePrice,
      'ratioChange': instance.ratioChange,
      'stockType': instance.stockType,
    };
