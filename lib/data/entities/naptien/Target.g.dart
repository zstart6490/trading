// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Target.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvestData _$InvestDataFromJson(Map<String, dynamic> json) => InvestData(
      target: Target.fromJson(json['target'] as Map<String, dynamic>),
      growData: (json['target_grow'] as List<dynamic>?)
          ?.map((e) => GrowData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InvestDataToJson(InvestData instance) =>
    <String, dynamic>{
      'target': instance.target,
      'target_grow': instance.growData,
    };

TargetData _$TargetDataFromJson(Map<String, dynamic> json) => TargetData(
      targets: (json['targets'] as List<dynamic>?)
              ?.map((e) => Target.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      userTargets: (json['user_targets'] as List<dynamic>?)
              ?.map((e) => Target.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      metaData: json['meta_data'] == null
          ? null
          : MetaData.fromJson(json['meta_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TargetDataToJson(TargetData instance) =>
    <String, dynamic>{
      'targets': instance.targets,
      'user_targets': instance.userTargets,
      'meta_data': instance.metaData,
    };

Target _$TargetFromJson(Map<String, dynamic> json) => Target(
      name: json['name'] as String?,
      description: json['description'] as String?,
      iconUrl: json['icon_url'] as String?,
      imageUrl: json['image_url'] as String?,
      minDepositAmount: json['min_deposit_amount'] as num? ?? 0,
      maxDepositAmount: json['max_deposit_amount'] as num? ?? 0,
      minWithdrawAmount: json['min_withdraw_amount'] as num? ?? 0.0,
      maxWithdrawAmount: json['max_withdraw_amount'] as num? ?? 0.0,
      withdrawalCondition: (json['withdrawal_condition'] as num?)?.toDouble(),
      currencyUnit: json['currency_unit'] as String?,
      rate: (json['rate'] as num?)?.toDouble(),
      order: json['order'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      userCount: json['user_count'] as int?,
      userIdDynamic: json['user_target_id'],
      targetIdDynamic: json['target_id'],
      targetType: $enumDecodeNullable(_$InvestProductTypeEnumMap, json['type']),
      originAmount: json['origin_amount'] as num? ?? 0.0,
      amount: json['amount'] as num? ?? 0.0,
      interestRate: json['interest_rate'] as num?,
      profit: json['profit'] as num?,
      firstDepositAmount: json['first_deposit_amount'] as int?,
      transactions: (json['transactions'] as List<dynamic>?)
          ?.map((e) => Transaction.fromJson(e as Map<String, dynamic>))
          .toList(),
      days: json['days'] as int?,
      sharpe: json['sharpe'] as num?,
      startedInvestingAt: json['started_investing_at'] == null
          ? null
          : DateTime.parse(json['started_investing_at'] as String),
      totalWithdrawAmount: json['total_withdraw_amount'] as num?,
      targetInfo: json['target_info'] == null
          ? null
          : TargetInfo.fromJson(json['target_info'] as Map<String, dynamic>),
      sellingAmount: json['selling_amount'] as num? ?? 0,
      buyingAmount: json['buying_amount'] as num? ?? 0,
      targetFunds: (json['target_funds'] as List<dynamic>?)
          ?.map((e) => TargetFund.fromJson(e as Map<String, dynamic>))
          .toList(),
      userTargetFunds: (json['user_target_funds'] as List<dynamic>?)
          ?.map((e) => TargetFund.fromJson(e as Map<String, dynamic>))
          .toList(),
      fundsFirstPriority: (json['funds'] as List<dynamic>?)
          ?.map((e) => Fund.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasInvested: json['has_invested'] as bool? ?? false,
      canRemove: json['can_remove'] as bool? ?? true,
      canSetting: json['can_setting'] as bool? ?? true,
    );

Map<String, dynamic> _$TargetToJson(Target instance) => <String, dynamic>{
      'user_target_id': instance.userIdDynamic,
      'target_id': instance.targetIdDynamic,
      'name': instance.name,
      'description': instance.description,
      'icon_url': instance.iconUrl,
      'image_url': instance.imageUrl,
      'min_deposit_amount': instance.minDepositAmount,
      'max_deposit_amount': instance.maxDepositAmount,
      'min_withdraw_amount': instance.minWithdrawAmount,
      'max_withdraw_amount': instance.maxWithdrawAmount,
      'withdrawal_condition': instance.withdrawalCondition,
      'currency_unit': instance.currencyUnit,
      'rate': instance.rate,
      'order': instance.order,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'user_count': instance.userCount,
      'amount': instance.amount,
      'origin_amount': instance.originAmount,
      'interest_rate': instance.interestRate,
      'profit': instance.profit,
      'first_deposit_amount': instance.firstDepositAmount,
      'days': instance.days,
      'sharpe': instance.sharpe,
      'started_investing_at': instance.startedInvestingAt?.toIso8601String(),
      'total_withdraw_amount': instance.totalWithdrawAmount,
      'type': _$InvestProductTypeEnumMap[instance.targetType],
      'target_info': instance.targetInfo,
      'selling_amount': instance.sellingAmount,
      'buying_amount': instance.buyingAmount,
      'target_funds': instance.targetFunds,
      'user_target_funds': instance.userTargetFunds,
      'funds': instance.fundsFirstPriority,
      'transactions': instance.transactions,
      'has_invested': instance.hasInvested,
      'can_remove': instance.canRemove,
      'can_setting': instance.canSetting,
    };

const _$InvestProductTypeEnumMap = {
  InvestProductType.flexible: 'FLEXIBLE',
  InvestProductType.sample: 'SAMPLE',
};

TargetInfo _$TargetInfoFromJson(Map<String, dynamic> json) => TargetInfo(
      idDynamic: json['id'],
      name: json['name'] as String?,
      type: $enumDecode(_$InvestProductTypeEnumMap, json['type']),
      description: json['description'] as String?,
      iconUrl: json['icon_url'] as String?,
      imageUrl: json['image_url'] as String?,
      rate: json['rate'] as int?,
    );

Map<String, dynamic> _$TargetInfoToJson(TargetInfo instance) =>
    <String, dynamic>{
      'id': instance.idDynamic,
      'name': instance.name,
      'type': _$InvestProductTypeEnumMap[instance.type],
      'description': instance.description,
      'icon_url': instance.iconUrl,
      'image_url': instance.imageUrl,
      'rate': instance.rate,
    };

WithdrawInvestTarget _$WithdrawInvestTargetFromJson(
        Map<String, dynamic> json) =>
    WithdrawInvestTarget(
      json['id'],
      json['user_target_id'],
      json['name'] as String,
      json['balance'] as int,
      json['remain_balance'] as int,
      json['icon_url'] as String,
    );

Map<String, dynamic> _$WithdrawInvestTargetToJson(
        WithdrawInvestTarget instance) =>
    <String, dynamic>{
      'id': instance.idDynamic,
      'user_target_id': instance.userTargetIdDynamic,
      'name': instance.name,
      'balance': instance.balance,
      'remain_balance': instance.remainBalance,
      'icon_url': instance.iconUrl,
    };
