import 'package:json_annotation/json_annotation.dart';

part 'Fund.g.dart';

@JsonSerializable()
class TargetFund {
  TargetFund({
    this.idDynamic,
    this.targetId,
    this.fundId,
    required this.percent,
    this.rate,
    this.order,
    this.createdAt,
    this.updatedAt,
    this.amount,
    this.total,
    required this.percentSetting,
    this.growInvestPercent,
    required this.fund,
  });

  final dynamic idDynamic;
  @JsonKey(name: "target_id")
  final dynamic targetId;
  @JsonKey(name: "fund_id")
  final dynamic fundId;
  @JsonKey(name: "percent", defaultValue: 0.0)
  final num percent;
  final int? rate;
  final int? order;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @JsonKey(name: "percent_setting", defaultValue: 0.0)
  final num percentSetting;
  final num? amount;
  final num? total;
  @JsonKey(name: "grow_invest_percent")
  final num? growInvestPercent;
  final Fund fund;

  factory TargetFund.fromJson(Map<String, dynamic> json) =>
      _$TargetFundFromJson(json);

  Fund get toFund => fund.copyWith(
      total: total?.toDouble(),
      amount: amount?.toDouble(),
      percentDefault: percent.toDouble(),
      percentSetting: percentSetting.toDouble());
  Map<String, dynamic> toJson() => _$TargetFundToJson(this);
}

@JsonSerializable()
class Fund {
  Fund({
    this.idDynamic,
    this.code,
    this.name,
    this.description,
    this.companyName,
    this.postedAt,
    required this.rate,
    this.colorChart,
    this.link,
    required this.percentDefault,
    required this.percentSetting,
    this.type,
    this.shortDescription,
    this.minCollectAmount,
    this.transactionId,
    this.batch,
    this.status,
    this.fundId,
    this.packageId,
    this.referId,
    this.nav,
    this.total,
    this.currentTotal,
    this.amount,
    this.currentAmount,
    this.createdAt,
    this.updatedAt,
    this.fundNavId,
    this.navs,
    this.isSelected = false,
  });
  @JsonKey(name: "id")
  final dynamic idDynamic;
  final String? code;
  final String? name;
  final String? type;
  @JsonKey(name: "short_description")
  final String? shortDescription;
  final String? description;
  @JsonKey(name: "company_name")
  final String? companyName;
  @JsonKey(name: "posted_at")
  final String? postedAt;
  @JsonKey(name: "rate", defaultValue: 0.0)
  final double rate;
  @JsonKey(name: "min_collect_amount")
  final int? minCollectAmount;
  @JsonKey(name: "color_chart")
  final String? colorChart;
  final String? link;
  @JsonKey(name: "percent", defaultValue: 0.0)
  double percentDefault;
  @JsonKey(name: "percent_setting", defaultValue: 0.0)
  double percentSetting;
  @JsonKey(name: "transaction_id")
  final int? transactionId;
  final String? batch;
  final String? status;
  @JsonKey(name: "fund_id")
  final dynamic fundId;
  @JsonKey(name: "package_id")
  final int? packageId;
  @JsonKey(name: "refer_id")
  final int? referId;
  final double? nav;
  final double? total;
  @JsonKey(name: "current_total")
  final double? currentTotal;
  final double? amount;
  @JsonKey(name: "current_amount")
  final double? currentAmount;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @JsonKey(name: "fund_nav_id")
  final int? fundNavId;
  final List<NavData>? navs;

  @JsonKey(ignore: true)
  bool isSelected;

  int get id => _getId();

  static List<Fund> fromAllocate(dynamic data) {
    final list = data["allocation"] as List;
    return list.map((e) => Fund.fromJson(e as Map<String, dynamic>)).toList();
  }

  static List<Fund> getList(dynamic data) {
    final list = data["funds"] as List;
    return list.map((e) => Fund.fromJson(e as Map<String, dynamic>)).toList();
  }

  static Fund fromResult(dynamic data) =>
      Fund.fromJson(data["fund"] as Map<String, dynamic>);
  factory Fund.fromJson(Map<String, dynamic> json) => _$FundFromJson(json);
  Map<String, dynamic> toJson() => _$FundToJson(this);

  int _getId() {
    if (idDynamic is int) {
      return idDynamic as int;
    } else if (idDynamic is String) {
      return int.tryParse(idDynamic as String) ?? 0;
    } else {
      return id;
    }
  }

  Fund copyWith({
    dynamic idDynamic,
    String? code,
    String? name,
    String? type,
    String? shortDescription,
    String? description,
    String? companyName,
    double? percentDefault,
    double? percentSetting,
    String? postedAt,
    double? rate,
    int? minCollectAmount,
    String? colorChart,
    String? link,
    int? transactionId,
    String? batch,
    String? status,
    dynamic fundId,
    int? packageId,
    int? referId,
    double? nav,
    double? total,
    double? currentTotal,
    double? amount,
    double? currentAmount,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? fundNavId,
    List<NavData>? navs,
  }) {
    return Fund(
      idDynamic: idDynamic ?? this.idDynamic,
      code: code ?? this.code,
      name: name ?? this.name,
      type: type ?? this.type,
      shortDescription: shortDescription ?? this.shortDescription,
      description: description ?? this.description,
      companyName: companyName ?? this.companyName,
      postedAt: postedAt ?? this.postedAt,
      rate: rate ?? this.rate,
      percentDefault: percentDefault ?? this.percentDefault,
      percentSetting: percentSetting ?? this.percentSetting,
      minCollectAmount: minCollectAmount ?? this.minCollectAmount,
      colorChart: colorChart ?? this.colorChart,
      link: link ?? this.link,
      transactionId: transactionId ?? this.transactionId,
      batch: batch ?? this.batch,
      status: status ?? this.status,
      fundId: fundId ?? this.fundId,
      packageId: packageId ?? this.packageId,
      referId: referId ?? this.referId,
      nav: nav ?? this.nav,
      total: total ?? this.total,
      currentTotal: currentTotal ?? this.currentTotal,
      amount: amount ?? this.amount,
      currentAmount: currentAmount ?? this.currentAmount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      fundNavId: fundNavId ?? this.fundNavId,
      navs: navs ?? this.navs,
    );
  }

  // double _getPercentSetting() {
  //   return percentSetting;
  // }
}

@JsonSerializable()
class NavData {
  NavData({
    this.time,
    required this.amount,
    required this.currencyUnit,
  });

  final DateTime? time;
  final double amount;
  @JsonKey(name: "currency_unit")
  final String currencyUnit;

  int get timeStamp =>
      time?.millisecondsSinceEpoch ?? DateTime.now().millisecondsSinceEpoch;
  factory NavData.fromJson(Map<String, dynamic> json) =>
      _$NavDataFromJson(json);
  Map<String, dynamic> toJson() => _$NavDataToJson(this);
}
