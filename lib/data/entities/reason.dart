import 'package:json_annotation/json_annotation.dart';
import 'package:trading_module/domain/entities/reason.dart';

part 'reason.g.dart';

@JsonSerializable()
class ReasonDto {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "content")
  final String? reason;
  @JsonKey(ignore: true)
  String? note;

  ReasonDto({
    this.id,
    this.reason,
  });

  static List<ReasonDto> getList(dynamic data) {
    final list = data as List;
    return list
        .map((e) => ReasonDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  factory ReasonDto.other() {
    return ReasonDto(id: 0, reason: "Lý do khác");
  }

  factory ReasonDto.fromJson(Map<String, dynamic> json) =>
      _$ReasonDtoFromJson(json);

}

extension ReasonMapper on ReasonDto {
  Reason toModel() {
    return Reason(id: id ?? 0, reason: reason ?? "");
  }
}
