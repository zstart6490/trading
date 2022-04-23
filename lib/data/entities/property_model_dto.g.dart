// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertyModelDTO _$PropertyModelDTOFromJson(Map<String, dynamic> json) =>
    PropertyModelDTO(
      json['id'] as int?,
      json['productKey'] as String?,
      json['productType'] as int?,
      (json['quantity'] as num?)?.toDouble(),
      (json['priceAvg'] as num?)?.toDouble(),
      (json['ceiling'] as num?)?.toDouble(),
      (json['floor'] as num?)?.toDouble(),
      (json['refPrice'] as num?)?.toDouble(),
      (json['lastPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PropertyModelDTOToJson(PropertyModelDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productKey': instance.productKey,
      'productType': instance.productType,
      'quantity': instance.quantity,
      'priceAvg': instance.priceAvg,
      'ceiling': instance.ceiling,
      'floor': instance.floor,
      'refPrice': instance.refPrice,
      'lastPrice': instance.lastPrice,
    };
