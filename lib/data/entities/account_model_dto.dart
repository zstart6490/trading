import 'package:json_annotation/json_annotation.dart';
import 'package:trading_module/domain/entities/account_info_model.dart';


part 'account_model_dto.g.dart';

@JsonSerializable()
class AccountInfoModelDTO {
  @JsonKey(name: "total")
  final double? total;
  @JsonKey(name: "interest")
  final double? interest;
  @JsonKey(name: "stock")
  final double? stock;

  AccountInfoModelDTO(this.total,this.interest,this.stock);

  static AccountInfoModelDTO fromResult(dynamic data) =>
      AccountInfoModelDTO.fromJson(data as Map<String, dynamic>);

  factory AccountInfoModelDTO.fromJson(dynamic json) =>
      _$AccountInfoModelDTOFromJson(json as Map<String,dynamic>);

  Map<String, dynamic> toJson() => _$AccountInfoModelDTOToJson(this);
}


extension AccountInfoModelMapper on AccountInfoModelDTO {
  AccountInfoModel toModel() {
    return AccountInfoModel(total:total ?? 0, interest:interest ?? 0, stock:stock ?? 0);
  }
}
