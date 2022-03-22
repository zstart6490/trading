// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Fund.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TargetFund _$TargetFundFromJson(Map<String, dynamic> json) => TargetFund(
      idDynamic: json['idDynamic'],
      targetId: json['target_id'],
      fundId: json['fund_id'],
      percent: json['percent'] as num? ?? 0.0,
      rate: json['rate'] as int?,
      order: json['order'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      amount: json['amount'] as num?,
      total: json['total'] as num?,
      percentSetting: json['percent_setting'] as num? ?? 0.0,
      growInvestPercent: json['grow_invest_percent'] as num?,
      fund: Fund.fromJson(json['fund'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TargetFundToJson(TargetFund instance) =>
    <String, dynamic>{
      'idDynamic': instance.idDynamic,
      'target_id': instance.targetId,
      'fund_id': instance.fundId,
      'percent': instance.percent,
      'rate': instance.rate,
      'order': instance.order,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'percent_setting': instance.percentSetting,
      'amount': instance.amount,
      'total': instance.total,
      'grow_invest_percent': instance.growInvestPercent,
      'fund': instance.fund,
    };

Fund _$FundFromJson(Map<String, dynamic> json) => Fund(
      idDynamic: json['id'],
      code: json['code'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      companyName: json['company_name'] as String?,
      postedAt: json['posted_at'] as String?,
      rate: (json['rate'] as num?)?.toDouble() ?? 0.0,
      colorChart: json['color_chart'] as String?,
      link: json['link'] as String?,
      percentDefault: (json['percent'] as num?)?.toDouble() ?? 0.0,
      percentSetting: (json['percent_setting'] as num?)?.toDouble() ?? 0.0,
      type: json['type'] as String?,
      shortDescription: json['short_description'] as String?,
      minCollectAmount: json['min_collect_amount'] as int?,
      transactionId: json['transaction_id'] as int?,
      batch: json['batch'] as String?,
      status: json['status'] as String?,
      fundId: json['fund_id'],
      packageId: json['package_id'] as int?,
      referId: json['refer_id'] as int?,
      nav: (json['nav'] as num?)?.toDouble(),
      total: (json['total'] as num?)?.toDouble(),
      currentTotal: (json['current_total'] as num?)?.toDouble(),
      amount: (json['amount'] as num?)?.toDouble(),
      currentAmount: (json['current_amount'] as num?)?.toDouble(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      fundNavId: json['fund_nav_id'] as int?,
      navs: (json['navs'] as List<dynamic>?)
          ?.map((e) => NavData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FundToJson(Fund instance) => <String, dynamic>{
      'id': instance.idDynamic,
      'code': instance.code,
      'name': instance.name,
      'type': instance.type,
      'short_description': instance.shortDescription,
      'description': instance.description,
      'company_name': instance.companyName,
      'posted_at': instance.postedAt,
      'rate': instance.rate,
      'min_collect_amount': instance.minCollectAmount,
      'color_chart': instance.colorChart,
      'link': instance.link,
      'percent': instance.percentDefault,
      'percent_setting': instance.percentSetting,
      'transaction_id': instance.transactionId,
      'batch': instance.batch,
      'status': instance.status,
      'fund_id': instance.fundId,
      'package_id': instance.packageId,
      'refer_id': instance.referId,
      'nav': instance.nav,
      'total': instance.total,
      'current_total': instance.currentTotal,
      'amount': instance.amount,
      'current_amount': instance.currentAmount,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'fund_nav_id': instance.fundNavId,
      'navs': instance.navs,
    };

NavData _$NavDataFromJson(Map<String, dynamic> json) => NavData(
      time:
          json['time'] == null ? null : DateTime.parse(json['time'] as String),
      amount: (json['amount'] as num).toDouble(),
      currencyUnit: json['currency_unit'] as String,
    );

Map<String, dynamic> _$NavDataToJson(NavData instance) => <String, dynamic>{
      'time': instance.time?.toIso8601String(),
      'amount': instance.amount,
      'currency_unit': instance.currencyUnit,
    };
