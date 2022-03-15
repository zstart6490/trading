import 'package:json_annotation/json_annotation.dart';
import 'package:trading_module/utils/enums.dart';


import 'Transaction.dart';

part 'SavingProduct.g.dart';

@JsonSerializable()
class SavingProduct {
  @JsonKey(name: "id")
  final dynamic idDynamic;
  @JsonKey(name: "name")
  final String? fullName;
  @JsonKey(name: "title")
  final String? shortName;
  final String? content;
  final String? cover;
  final String? thumb;
  final String? icon;
  final String? type;
  @JsonKey(name: "core_interest")
  final double? coreInterest;
  @JsonKey(name: "type_interest")
  final String? typeInterest;
  @JsonKey(name: "start_time")
  final DateTime? startTime;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  final String? status;
  @JsonKey(defaultValue: 0)
  final int period;
  final List<Transaction>? items;
  @JsonKey(name: "min_money_user", defaultValue: 0)
  final int minMoneyUser;
  @JsonKey(name: "max_money_user", defaultValue: 0)
  final int maxMoneyUser;
  @JsonKey(name: "total_used", defaultValue: 0)
  final int totalUsed;
  final String? cate;
  @JsonKey(name: "total_account", defaultValue: 0)
  final int totalAccount;
  @JsonKey(name: "total_interest", defaultValue: 0)
  final double totalInterest;
  final String? note;
  final String? caption;
  final String? mathInterest;
  final List<int>? month;
  @JsonKey(name: "invest_type")
  final InvestType? investType;
  @JsonKey(name: "multiple_of", defaultValue: 1)
  final int multipleOf;
  @JsonKey(name: "vat_percent", defaultValue: 0)
  final double vatPercent;

  /// Saving product update
  @JsonKey(name: "saving_account_id", defaultValue: 0)
  final double? savingAccountId;
  @JsonKey(name: "total_balance", defaultValue: 0)
  final double? totalBalance;
  @JsonKey(name: "temporary_interest", defaultValue: 0)
  final double? temporaryInterest;
  @JsonKey(name: "total_settlement", defaultValue: 0)
  final double? totalSettlement;
  @JsonKey(name: "canTransfer")
  final bool canTransfer;

  SavingProduct({
    this.idDynamic,
    this.fullName,
    this.shortName,
    this.content,
    this.cover,
    this.thumb,
    this.icon,
    this.type,
    this.coreInterest,
    this.typeInterest,
    this.startTime,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.period = 0,
    this.items,
    this.minMoneyUser = 0,
    this.maxMoneyUser = 0,
    this.totalUsed = 0,
    this.cate,
    this.totalAccount = 0,
    this.totalInterest = 0,
    this.note,
    this.caption,
    this.mathInterest,
    this.month,
    this.investType = InvestType.normal,
    this.multipleOf = 1,
    this.vatPercent = 5,
    this.savingAccountId,
    this.totalBalance,
    this.temporaryInterest,
    this.totalSettlement,
    this.canTransfer = false,
  });
  String get id => "$idDynamic";

  /// Tính tổng lãi
  int get getTotalProfit => _getTotalProfit();

  /// Check gói có kỳ hạn
  bool get isLimited => type == "LIMITED";

  /// Check gói bất động sản
  bool get isRealEstate => type == "REAL_ESTATE";

  /// Gói đang được active hay không
  bool get isActive => status == "ACTIVE";

  /// Check gói có thể tái tục hợp đồng hay ko
  /// Các gói đang active
  /// Không phải gói bất động sản
  /// (Bất động sản logic cũ investType == InvestType.normal)
  /// (Bất động sản logic sprint 42 isRealEstate)
  bool get canRenew =>
      isActive && !isRealEstate && investType == InvestType.normal;

  static List<SavingProduct> fromContractSaving(dynamic map) {
    final list = map["products"] as List;
    return list
        .map((obj) => SavingProduct.fromJson(obj as Map<String, dynamic>))
        .toList();
  }

  static List<SavingProduct> fromListProducts(dynamic map) {
    final list = map["product"] as List;
    return list
        .map((obj) => SavingProduct.fromJson(obj as Map<String, dynamic>))
        .toList();
  }

  static List<SavingProduct> fromProducts(dynamic map) {
    final list = map["product"] as List;
    return list
        .map((obj) => SavingProduct.fromJson(obj as Map<String, dynamic>))
        .toList();
  }

  static List<SavingProduct> fromTransferSaving(dynamic map) {
    final list = map["listContract"] as List;
    return list
        .map((obj) => SavingProduct.fromJson(obj as Map<String, dynamic>))
        .toList();
  }

  factory SavingProduct.fromJson(Map<String, dynamic> json) =>
      _$SavingProductFromJson(json);
  Map<String, dynamic> toJson() => _$SavingProductToJson(this);

  int _getTotalProfit() {
    if (items == null || items!.isEmpty) return 0;
    var total = 0;
    for (final item in items!) {
      total += item.temporaryInterest;
    }
    return total;
  }
}

@JsonSerializable()
class GetInterestResult {
  final double? amount;
  @JsonKey(name: "min_interest")
  final double? minInterest;
  @JsonKey(name: "min_interest_rate")
  final double? minInterestRate;

  GetInterestResult({
    this.amount,
    this.minInterest,
    this.minInterestRate,
  });

  static GetInterestResult fromResult(dynamic map) =>
      GetInterestResult.fromJson(map as Map<String, dynamic>);
  factory GetInterestResult.fromJson(Map<String, dynamic> json) =>
      _$GetInterestResultFromJson(json);
  Map<String, dynamic> toJson() => _$GetInterestResultToJson(this);
}

class SavingProductNotEnough {
  final SavingProduct savingProduct;
  final double amount;

  SavingProductNotEnough({
    required this.savingProduct,
    required this.amount,
  });
}
