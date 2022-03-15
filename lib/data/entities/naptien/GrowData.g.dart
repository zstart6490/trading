// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GrowData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GrowData _$GrowDataFromJson(Map<String, dynamic> json) => GrowData(
      json['time'] as int,
      (json['amount'] as num).toDouble(),
      (json['percent'] as num).toDouble(),
      (json['amount_grow'] as num).toDouble(),
    );

Map<String, dynamic> _$GrowDataToJson(GrowData instance) => <String, dynamic>{
      'time': instance.timeStamp,
      'amount': instance.amount,
      'percent': instance.percent,
      'amount_grow': instance.amountGrow,
    };

InvestedInfo _$InvestedInfoFromJson(Map<String, dynamic> json) => InvestedInfo(
      amount: json['amount'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => InvestedInfoData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InvestedInfoToJson(InvestedInfo instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'data': instance.data,
    };

InvestedInfoData _$InvestedInfoDataFromJson(Map<String, dynamic> json) =>
    InvestedInfoData(
      id: json['id'] as int,
      name: json['name'] as String?,
      amount: json['amount'] as int,
      userId: json['user_id'] as int,
      targetId: json['target_id'] as int,
      originInvestBalanceAmount: json['originInvestBalanceAmount'] as int? ?? 0,
    );

Map<String, dynamic> _$InvestedInfoDataToJson(InvestedInfoData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'amount': instance.amount,
      'user_id': instance.userId,
      'target_id': instance.targetId,
      'originInvestBalanceAmount': instance.originInvestBalanceAmount,
    };
