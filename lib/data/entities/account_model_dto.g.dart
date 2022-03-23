// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountInfoModelDTO _$AccountInfoModelDTOFromJson(Map<String, dynamic> json) =>
    AccountInfoModelDTO(
      (json['total'] as num?)?.toDouble(),
      (json['interest'] as num?)?.toDouble(),
      (json['stock'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AccountInfoModelDTOToJson(
        AccountInfoModelDTO instance) =>
    <String, dynamic>{
      'total': instance.total,
      'interest': instance.interest,
      'stock': instance.stock,
    };
