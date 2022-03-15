import 'package:json_annotation/json_annotation.dart';

part 'reason.g.dart';

@JsonSerializable()
class Reason {
  @JsonKey(name: "id")
  final dynamic idDynamic;
  final String reason;
  @JsonKey(ignore: true)
  String? note;

  Reason({
    this.idDynamic,
    required this.reason,
  });

  String get id => "$idDynamic";
  static List<Reason> getList(dynamic data) {
    final list = data["reasons"] as List;
    return list.map((e) => Reason.fromJson(e as Map<String, dynamic>)).toList();
  }

  factory Reason.other() {
    return Reason(idDynamic: "0", reason: "Lý do khác");
  }

  factory Reason.fromJson(Map<String, dynamic> json) => _$ReasonFromJson(json);
  Map<String, dynamic> toJson() => _$ReasonToJson(this);
}
