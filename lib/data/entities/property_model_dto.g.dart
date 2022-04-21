// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertyModelDTO _$PropertyModelDTOFromJson(Map<String, dynamic> json) =>
    PropertyModelDTO(
      json['id'] as int?,
      json['productKey'] as String?,
      (json['quantity'] as num?)?.toDouble(),
      (json['priceAvg'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PropertyModelDTOToJson(PropertyModelDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productKey': instance.productKey,
      'quantity': instance.quantity,
      'priceAvg': instance.priceAvg,
    };
