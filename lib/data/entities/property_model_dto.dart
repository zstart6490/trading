import 'package:json_annotation/json_annotation.dart';
import 'package:trading_module/domain/entities/property_model.dart';

part 'property_model_dto.g.dart';

@JsonSerializable()
class PropertyModelDTO {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "productKey")
  final String? productKey;
  @JsonKey(name: "quantity")
  final double? quantity;
  @JsonKey(name: "priceAvg")
  final double? priceAvg;

  PropertyModelDTO(
    this.id,
    this.productKey,
    this.quantity,
    this.priceAvg,
  );

  static PropertyModelDTO fromResult(dynamic data) =>
      PropertyModelDTO.fromJson(data as Map<String, dynamic>);

  factory PropertyModelDTO.fromJson(dynamic json) =>
      _$PropertyModelDTOFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$PropertyModelDTOToJson(this);
}

extension AccountInfoModelMapper on PropertyModelDTO {
  PropertyModel toModel() {
    return PropertyModel(
      id,
      productKey,
      quantity,
      priceAvg,
    );
  }
}
