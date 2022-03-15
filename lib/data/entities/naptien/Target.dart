import 'package:json_annotation/json_annotation.dart';
import 'package:tikop/models/Ranking.dart';

import 'package:tikop/utils/enums.dart';

import 'Fund.dart';
import 'GrowData.dart';
import 'Transaction.dart';
import 'Notifications.dart';

part 'Target.g.dart';

@JsonSerializable()
class InvestData {
  @JsonKey(name: "target")
  Target target;
  @JsonKey(name: "target_grow")
  List<GrowData>? growData;

  InvestData({required this.target, this.growData});
  static InvestData fromResult(dynamic data) =>
      InvestData.fromJson(data as Map<String, dynamic>);
  factory InvestData.fromJson(Map<String, dynamic> json) =>
      _$InvestDataFromJson(json);
  Map<String, dynamic> toJson() => _$InvestDataToJson(this);

  InvestData copyWith({
    Target? target,
    List<GrowData>? growData,
  }) {
    return InvestData(
      target: target ?? this.target,
      growData: growData ?? this.growData,
    );
  }
}

@JsonSerializable()
class TargetData {
  @JsonKey(name: "targets")
  final List<Target> targets;
  @JsonKey(name: "user_targets")
  List<Target> userTargets;
  @JsonKey(name: "meta_data")
  final MetaData? metaData;
  TargetData(
      {this.targets = const [], this.userTargets = const [], this.metaData});
  static TargetData fromResult(dynamic data) =>
      TargetData.fromJson(data as Map<String, dynamic>);

  factory TargetData.fromJson(Map<String, dynamic> json) =>
      _$TargetDataFromJson(json);
  Map<String, dynamic> toJson() => _$TargetDataToJson(this);
}

@JsonSerializable()
class Target {
  @JsonKey(name: "user_target_id")
  final dynamic userIdDynamic;
  @JsonKey(name: "target_id")
  final dynamic targetIdDynamic;
  final String? name;
  final String? description;
  @JsonKey(name: "icon_url")
  final String? iconUrl;
  @JsonKey(name: "image_url")
  final String? imageUrl;
  @JsonKey(name: "min_deposit_amount", defaultValue: 0)
  final num minDepositAmount;
  @JsonKey(name: "max_deposit_amount", defaultValue: 0)
  final num maxDepositAmount;
  @JsonKey(name: "min_withdraw_amount", defaultValue: 0.0)
  final num minWithdrawAmount;
  @JsonKey(name: "max_withdraw_amount", defaultValue: 0.0)
  final num maxWithdrawAmount;
  @JsonKey(name: "withdrawal_condition")
  final double? withdrawalCondition;
  @JsonKey(name: "currency_unit")
  final String? currencyUnit;
  final double? rate;
  final int? order;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @JsonKey(name: "user_count")
  final int? userCount;
  @JsonKey(name: "amount", defaultValue: 0.0)
  final num amount;
  @JsonKey(name: "origin_amount", defaultValue: 0.0)
  final num originAmount;
  @JsonKey(name: "interest_rate")
  final num? interestRate;
  final num? profit;
  @JsonKey(name: "first_deposit_amount")
  final int? firstDepositAmount;
  final int? days;
  final num? sharpe;
  @JsonKey(name: "started_investing_at")
  final DateTime? startedInvestingAt;
  @JsonKey(name: "total_withdraw_amount")
  final num? totalWithdrawAmount;
  @JsonKey(name: "type")
  final InvestProductType? targetType;
  @JsonKey(name: "target_info")
  final TargetInfo? targetInfo;
  @JsonKey(name: "selling_amount", defaultValue: 0)
  final num sellingAmount;
  @JsonKey(name: "buying_amount", defaultValue: 0)
  final num buyingAmount;
  @JsonKey(name: "target_funds")
  final List<TargetFund>? targetFunds;
  @JsonKey(name: "user_target_funds")
  final List<TargetFund>? userTargetFunds;
  @JsonKey(name: "funds")
  final List<Fund>? fundsFirstPriority;
  final List<Transaction>? transactions;
  @JsonKey(name: "has_invested", defaultValue: false)
  final bool hasInvested;
  @JsonKey(name: "can_remove", defaultValue: true)
  final bool canRemove;
  @JsonKey(name: "can_setting", defaultValue: true)
  final bool canSetting;
  final List<AllocateOverviewData>? allocate;

  Target({
    this.name,
    this.description,
    this.iconUrl,
    this.imageUrl,
    required this.minDepositAmount,
    required this.maxDepositAmount,
    required this.minWithdrawAmount,
    required this.maxWithdrawAmount,
    this.withdrawalCondition,
    this.currencyUnit,
    this.rate,
    this.order,
    this.createdAt,
    this.updatedAt,
    this.userCount,
    this.userIdDynamic,
    this.targetIdDynamic,
    this.targetType,
    required this.originAmount,
    required this.amount,
    this.interestRate,
    this.profit,
    this.firstDepositAmount,
    this.transactions,
    this.days,
    this.sharpe,
    this.startedInvestingAt,
    this.totalWithdrawAmount,
    this.targetInfo,
    this.sellingAmount = 0,
    this.buyingAmount = 0,
    this.targetFunds,
    this.userTargetFunds,
    this.fundsFirstPriority,
    this.hasInvested = false,
    this.canRemove = true,
    this.canSetting = true,
    this.allocate,
  });

  String get targetId => targetIdDynamic?.toString() ?? "0";
  String? get userId => userIdDynamic?.toString();

  List<Fund> get funds => _getListTargetFund();

  static Target fromUserTarget(dynamic data) =>
      Target.fromJson(data["user_target"] as Map<String, dynamic>);
  factory Target.fromJson(Map<String, dynamic> json) => _$TargetFromJson(json);
  InvestProductType get type =>
      targetType ?? targetInfo?.type ?? InvestProductType.flexible;

  Map<String, dynamic> toJson() => _$TargetToJson(this);

  List<Fund> _getListTargetFund() {
    List<Fund> result = [];
    if (fundsFirstPriority != null) {
      result = fundsFirstPriority!;
    } else {
      final funds = targetFunds ?? userTargetFunds;
      if (funds == null) return result;
      for (final t in funds) {
        result.add(t.toFund);
      }
    }
    return result.where((element) => element.percentSetting > 0.0).toList();
  }

  factory Target.empty() {
    return Target(
        minDepositAmount: 0,
        maxDepositAmount: 0,
        minWithdrawAmount: 0,
        maxWithdrawAmount: 0,
        originAmount: 0,
        amount: 0,
    );
  }

  Target merge(Target target) {
    return target.copyWith(
        userIdDynamic: userIdDynamic,
        targetIdDynamic: targetIdDynamic,
        amount: amount,
        hasInvested: hasInvested,
        canRemove: canRemove,
        name: name,
        iconUrl: iconUrl,
        imageUrl: imageUrl,
        originAmount: originAmount,
        targetFunds: targetFunds,
        userTargetFunds: userTargetFunds);
  }

  Target copyWith({
    dynamic userIdDynamic,
    dynamic targetIdDynamic,
    String? name,
    String? description,
    String? iconUrl,
    String? imageUrl,
    num? minDepositAmount,
    num? maxDepositAmount,
    num? minWithdrawAmount,
    num? maxWithdrawAmount,
    double? withdrawalCondition,
    String? currencyUnit,
    double? rate,
    int? order,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? userCount,
    num? amount,
    num? originAmount,
    num? interestRate,
    num? profit,
    int? firstDepositAmount,
    int? days,
    num? sharpe,
    DateTime? startedInvestingAt,
    num? totalWithdrawAmount,
    InvestProductType? targetType,
    TargetInfo? targetInfo,
    num? sellingAmount,
    num? buyingAmount,
    List<TargetFund>? targetFunds,
    List<TargetFund>? userTargetFunds,
    List<Fund>? fundsFirstPriority,
    List<Transaction>? transactions,
    bool? hasInvested,
    bool? canRemove,
   List<AllocateOverviewData>? allocate,
  }) {
    return Target(
      userIdDynamic: userIdDynamic ?? this.userIdDynamic,
      targetIdDynamic: targetIdDynamic ?? this.targetIdDynamic,
      name: name ?? this.name,
      description: description ?? this.description,
      iconUrl: iconUrl ?? this.iconUrl,
      imageUrl: imageUrl ?? this.imageUrl,
      minDepositAmount: minDepositAmount ?? this.minDepositAmount,
      maxDepositAmount: maxDepositAmount ?? this.maxDepositAmount,
      minWithdrawAmount: minWithdrawAmount ?? this.minWithdrawAmount,
      maxWithdrawAmount: maxWithdrawAmount ?? this.maxWithdrawAmount,
      withdrawalCondition: withdrawalCondition ?? this.withdrawalCondition,
      currencyUnit: currencyUnit ?? this.currencyUnit,
      rate: rate ?? this.rate,
      order: order ?? this.order,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      userCount: userCount ?? this.userCount,
      amount: amount ?? this.amount,
      originAmount: originAmount ?? this.originAmount,
      interestRate: interestRate ?? this.interestRate,
      profit: profit ?? this.profit,
      firstDepositAmount: firstDepositAmount ?? this.firstDepositAmount,
      days: days ?? this.days,
      sharpe: sharpe ?? this.sharpe,
      startedInvestingAt: startedInvestingAt ?? this.startedInvestingAt,
      totalWithdrawAmount: totalWithdrawAmount ?? this.totalWithdrawAmount,
      targetType: targetType ?? this.targetType,
      targetInfo: targetInfo ?? this.targetInfo,
      sellingAmount: sellingAmount ?? this.sellingAmount,
      buyingAmount: buyingAmount ?? this.buyingAmount,
      targetFunds: targetFunds ?? this.targetFunds,
      userTargetFunds: userTargetFunds ?? this.userTargetFunds,
      fundsFirstPriority: fundsFirstPriority ?? this.fundsFirstPriority,
      transactions: transactions ?? this.transactions,
      hasInvested: hasInvested ?? this.hasInvested,
      canRemove: canRemove ?? this.canRemove,
      allocate: allocate ?? this.allocate,
    );
  }
}

@JsonSerializable()
class TargetInfo {
  TargetInfo({
    this.idDynamic,
    this.name,
    required this.type,
    this.description,
    // this.homeDescription,
    this.iconUrl,
    this.imageUrl,
    this.rate,
  });

  @JsonKey(name: "id")
  final dynamic idDynamic;
  final String? name;

  final InvestProductType type;
  final String? description;
  // @JsonKey(name: "home_description")
  // final HomeDescription? homeDescription;
  @JsonKey(name: "icon_url")
  final String? iconUrl;
  @JsonKey(name: "image_url")
  final String? imageUrl;
  final int? rate;

  String get id => "$idDynamic";
  factory TargetInfo.fromJson(Map<String, dynamic> json) =>
      _$TargetInfoFromJson(json);
  Map<String, dynamic> toJson() => _$TargetInfoToJson(this);
}

@JsonSerializable()
class WithdrawInvestTarget {
  WithdrawInvestTarget(
    this.idDynamic,
    this.userTargetIdDynamic,
    this.name,
    this.balance,
    this.remainBalance,
    this.iconUrl,
  );

  @JsonKey(name: "id")
  final dynamic idDynamic;
  @JsonKey(name: "user_target_id")
  final dynamic userTargetIdDynamic;
  final String name;
  final int balance;
  @JsonKey(name: "remain_balance")
  final int remainBalance;
  @JsonKey(name: "icon_url")
  final String iconUrl;

  String get id => idDynamic?.toString() ?? "";
  String get userTargetId => userTargetIdDynamic?.toString() ?? "";

  factory WithdrawInvestTarget.fromJson(Map<String, dynamic> json) =>
      _$WithdrawInvestTargetFromJson(json);
  Map<String, dynamic> toJson() => _$WithdrawInvestTargetToJson(this);
}
