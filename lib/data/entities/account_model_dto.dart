import 'package:json_annotation/json_annotation.dart';
import 'package:trading_module/domain/entities/account_info_model.dart';


part 'account_model_dto.g.dart';


@JsonSerializable()
class AccountInfoModelDTO {
  @JsonKey(name: "total")
  final double? total;
  @JsonKey(name: "stockBalance")
  final double? stockBalance;
  @JsonKey(name: "cashBalance")
  final double? cashBalance;
  @JsonKey(name: "interest")
  final double? interest;
  @JsonKey(name: "pendingCashIn")
  final double? pendingCashIn;
  @JsonKey(name: "pendingCashOut")
  final double? pendingCashOut;


  AccountInfoModelDTO(this.total,this.stockBalance,this.cashBalance,this.interest,this.pendingCashIn,this.pendingCashOut);

  static AccountInfoModelDTO fromResult(dynamic data) =>
      AccountInfoModelDTO.fromJson(data as Map<String, dynamic>);

  factory AccountInfoModelDTO.fromJson(dynamic json) =>
      _$AccountInfoModelDTOFromJson(json as Map<String,dynamic>);

  Map<String, dynamic> toJson() => _$AccountInfoModelDTOToJson(this);
}


extension AccountInfoModelMapper on AccountInfoModelDTO {
  AccountInfoModel toModel() {
    return AccountInfoModel(total:total ?? 0,stockBalance: stockBalance ?? 0, cashBalance: cashBalance ?? 0, interest: interest ?? 0, pendingCashIn: pendingCashIn ?? 0, pendingCashOut: pendingCashOut ?? 0);
  }
}
