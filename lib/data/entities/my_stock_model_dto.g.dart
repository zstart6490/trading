// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_stock_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyStockModelDTO _$MyStockModelDTOFromJson(Map<String, dynamic> json) =>
    MyStockModelDTO(
      json['id'] as int?,
      json['productKey'] as String?,
      (json['quantity'] as num?)?.toDouble(),
      (json['priceAvg'] as num?)?.toDouble(),
      (json['amount'] as num?)?.toDouble(),
      json['stockName'] as String?,
      json['imageUrl'] as String?,
      (json['quantityWaitingReturn'] as num?)?.toDouble(),
      (json['dividendsWaitingReturn'] as num?)?.toDouble(),
      (json['portfolioHistoryList'] as List<dynamic>?)
          ?.map((e) => PortfolioModelDTO.fromJson(e))
          .toList(),
    );

Map<String, dynamic> _$MyStockModelDTOToJson(MyStockModelDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productKey': instance.productKey,
      'quantity': instance.quantity,
      'priceAvg': instance.priceAvg,
      'amount': instance.amount,
      'stockName': instance.stockName,
      'imageUrl': instance.imageUrl,
      'quantityWaitingReturn': instance.quantityWaitingReturn,
      'dividendsWaitingReturn': instance.dividendsWaitingReturn,
      'portfolioHistoryList': instance.portfolioHistoryList,
    };

PortfolioModelDTO _$PortfolioModelDTOFromJson(Map<String, dynamic> json) =>
    PortfolioModelDTO(
      json['id'] as int?,
      json['productKey'] as String?,
      (json['price'] as num?)?.toDouble(),
      (json['quantity'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PortfolioModelDTOToJson(PortfolioModelDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productKey': instance.productKey,
      'price': instance.price,
      'quantity': instance.quantity,
    };
