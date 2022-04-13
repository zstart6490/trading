// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountInfoModelDTO _$AccountInfoModelDTOFromJson(Map<String, dynamic> json) =>
    AccountInfoModelDTO(
      (json['stockList'] as num?)?.toDouble(),
      (json['pendingTransactions'] as List<dynamic>?)
          ?.map((e) => PendingTransactionModelDTO.fromJson(e))
          .toList(),
      (json['productWatchingVOList'] as List<dynamic>?)
          ?.map((e) => PendingTransactionModelDTO.fromJson(e))
          .toList(),
      (json['cashBalance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AccountInfoModelDTOToJson(
        AccountInfoModelDTO instance) =>
    <String, dynamic>{
      'stockList': instance.stockList,
      'pendingTransactions': instance.pendingTransactions,
      'productWatchingVOList': instance.productWatchingVOList,
      'cashBalance': instance.cashBalance,
    };

PendingTransactionModelDTO _$PendingTransactionModelDTOFromJson(
        Map<String, dynamic> json) =>
    PendingTransactionModelDTO(
      json['modifyTime'] as String?,
      json['productType'] as String?,
      (json['orderType'] as num?)?.toDouble(),
      (json['amount'] as num?)?.toDouble(),
      (json['actualAmount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PendingTransactionModelDTOToJson(
        PendingTransactionModelDTO instance) =>
    <String, dynamic>{
      'modifyTime': instance.modifyTime,
      'productType': instance.productType,
      'orderType': instance.orderType,
      'amount': instance.amount,
      'actualAmount': instance.actualAmount,
    };
