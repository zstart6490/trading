// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SavingProduct.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavingProduct _$SavingProductFromJson(Map<String, dynamic> json) =>
    SavingProduct(
      idDynamic: json['id'],
      fullName: json['name'] as String?,
      shortName: json['title'] as String?,
      content: json['content'] as String?,
      cover: json['cover'] as String?,
      thumb: json['thumb'] as String?,
      icon: json['icon'] as String?,
      type: json['type'] as String?,
      coreInterest: (json['core_interest'] as num?)?.toDouble(),
      typeInterest: json['type_interest'] as String?,
      startTime: json['start_time'] == null
          ? null
          : DateTime.parse(json['start_time'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      status: json['status'] as String?,
      period: json['period'] as int? ?? 0,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Transaction.fromJson(e as Map<String, dynamic>))
          .toList(),
      minMoneyUser: json['min_money_user'] as int? ?? 0,
      maxMoneyUser: json['max_money_user'] as int? ?? 0,
      totalUsed: json['total_used'] as int? ?? 0,
      cate: json['cate'] as String?,
      totalAccount: json['total_account'] as int? ?? 0,
      totalInterest: (json['total_interest'] as num?)?.toDouble() ?? 0,
      note: json['note'] as String?,
      caption: json['caption'] as String?,
      mathInterest: json['mathInterest'] as String?,
      month: (json['month'] as List<dynamic>?)?.map((e) => e as int).toList(),
      investType:
          $enumDecodeNullable(_$InvestTypeEnumMap, json['invest_type']) ??
              InvestType.normal,
      multipleOf: json['multiple_of'] as int? ?? 1,
      vatPercent: (json['vat_percent'] as num?)?.toDouble() ?? 0,
      savingAccountId: (json['saving_account_id'] as num?)?.toDouble() ?? 0,
      totalBalance: (json['total_balance'] as num?)?.toDouble() ?? 0,
      temporaryInterest: (json['temporary_interest'] as num?)?.toDouble() ?? 0,
      totalSettlement: (json['total_settlement'] as num?)?.toDouble() ?? 0,
      canTransfer: json['canTransfer'] as bool? ?? false,
    );

Map<String, dynamic> _$SavingProductToJson(SavingProduct instance) =>
    <String, dynamic>{
      'id': instance.idDynamic,
      'name': instance.fullName,
      'title': instance.shortName,
      'content': instance.content,
      'cover': instance.cover,
      'thumb': instance.thumb,
      'icon': instance.icon,
      'type': instance.type,
      'core_interest': instance.coreInterest,
      'type_interest': instance.typeInterest,
      'start_time': instance.startTime?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'status': instance.status,
      'period': instance.period,
      'items': instance.items,
      'min_money_user': instance.minMoneyUser,
      'max_money_user': instance.maxMoneyUser,
      'total_used': instance.totalUsed,
      'cate': instance.cate,
      'total_account': instance.totalAccount,
      'total_interest': instance.totalInterest,
      'note': instance.note,
      'caption': instance.caption,
      'mathInterest': instance.mathInterest,
      'month': instance.month,
      'invest_type': _$InvestTypeEnumMap[instance.investType],
      'multiple_of': instance.multipleOf,
      'vat_percent': instance.vatPercent,
      'saving_account_id': instance.savingAccountId,
      'total_balance': instance.totalBalance,
      'temporary_interest': instance.temporaryInterest,
      'total_settlement': instance.totalSettlement,
      'canTransfer': instance.canTransfer,
    };

const _$InvestTypeEnumMap = {
  InvestType.normal: 'NORMAL',
  InvestType.property: 'PROPERTY',
};

GetInterestResult _$GetInterestResultFromJson(Map<String, dynamic> json) =>
    GetInterestResult(
      amount: (json['amount'] as num?)?.toDouble(),
      minInterest: (json['min_interest'] as num?)?.toDouble(),
      minInterestRate: (json['min_interest_rate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GetInterestResultToJson(GetInterestResult instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'min_interest': instance.minInterest,
      'min_interest_rate': instance.minInterestRate,
    };
