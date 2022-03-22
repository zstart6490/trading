import 'package:json_annotation/json_annotation.dart';

part 'GrowData.g.dart';

@JsonSerializable()
class GrowData {
  @JsonKey(name: "time")
  int timeStamp;
  double amount;
  double percent;
  @JsonKey(name: "amount_grow")
  double amountGrow;
  GrowData(
    this.timeStamp,
    this.amount,
    this.percent,
    this.amountGrow,
  );

  double get timeDouble => timeStamp.toDouble();
  static List<GrowData> getList(dynamic map) {
    final list = map["target_grow"] as List;
    return list
        .map((e) => GrowData.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  factory GrowData.now(double amount, double percent, double amountGrow) {
    final timeStamp = DateTime.now().millisecondsSinceEpoch;
    return GrowData(timeStamp, amount, percent, amountGrow);
  }
  factory GrowData.fromJson(Map<String, dynamic> json) =>
      _$GrowDataFromJson(json);
  Map<String, dynamic> toJson() => _$GrowDataToJson(this);

  GrowData copyWith({
    int? timeStamp,
    double? amount,
    double? percent,
    double? amountGrow,
  }) {
    return GrowData(
      timeStamp ?? this.timeStamp,
      amount ?? this.amount,
      percent ?? this.percent,
      amountGrow ?? this.amountGrow,
    );
  }
}

@JsonSerializable()
class InvestedInfo {
  InvestedInfo({
    required this.amount,
    required this.data,
  });

  final int amount;
  final List<InvestedInfoData> data;

  factory InvestedInfo.fromJson(Map<String, dynamic> json) =>
      _$InvestedInfoFromJson(json);
  Map<String, dynamic> toJson() => _$InvestedInfoToJson(this);
}

@JsonSerializable()
class InvestedInfoData {
  InvestedInfoData({
    required this.id,
    required this.name,
    required this.amount,
    required this.userId,
    required this.targetId,
    required this.originInvestBalanceAmount,
  });

  final int id;
  final String? name;

  final int amount;
  @JsonKey(name: "user_id")
  final int userId;
  @JsonKey(name: "target_id")
  final int targetId;
  @JsonKey(name: "originInvestBalanceAmount", defaultValue: 0)
  final int originInvestBalanceAmount;

  factory InvestedInfoData.fromJson(Map<String, dynamic> json) =>
      _$InvestedInfoDataFromJson(json);
  Map<String, dynamic> toJson() => _$InvestedInfoDataToJson(this);
}
