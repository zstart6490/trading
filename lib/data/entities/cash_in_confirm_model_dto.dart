import 'package:json_annotation/json_annotation.dart';
import 'package:trading_module/domain/entities/cash_in_confirm_model.dart';

part 'cash_in_confirm_model_dto.g.dart';

@JsonSerializable()
class CashInConfirmModelDTO {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "requestAmount")
  final int? requestAmount;
  @JsonKey(name: "amount")
  final int? amount;
  @JsonKey(name: "fee")
  final int? fee;
  @JsonKey(name: "vat")
  final int? vat;
  @JsonKey(name: "discount")
  dynamic discount;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "bankCode")
  dynamic bankCode;
  @JsonKey(name: "transferType")
  final String? transferType;
  @JsonKey(name: "transferCode")
  final String? transferCode;
  @JsonKey(name: "feeType")
  final String? feeType;
  @JsonKey(name: "content")
  dynamic content;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "createDate")
  final String? createDate;
  @JsonKey(name: "updateDate")
  final String? updateDate;
  @JsonKey(name: "refId")
  dynamic refId;
  @JsonKey(name: "parentId")
  final String? parentId;
  @JsonKey(name: "plus")
  final bool? plus;
  @JsonKey(name: "icon")
  final String? icon;
  @JsonKey(name: "method")
  dynamic method;
  @JsonKey(name: "data")
  final List<BankModelDTO>? data;
  @JsonKey(name: "redirectUrl")
  final String? redirectUrl;
  @JsonKey(name: "order")
  dynamic order;
  @JsonKey(name: "fromUserId")
  final int? fromUserId;
  @JsonKey(name: "toUserId")
  final int? toUserId;
  @JsonKey(name: "fromUserBalance")
  final int? fromUserBalance;
  @JsonKey(name: "toUserBalance")
  final int? toUserBalance;
  @JsonKey(name: "linkBanks")
  dynamic linkBanks;
  @JsonKey(name: "total")
  final int? total;
  @JsonKey(name: "typeName")
  final String? typeName;
  @JsonKey(name: "completed")
  final bool? completed;
  @JsonKey(name: "statusName")
  final String? statusName;
  @JsonKey(name: "disable")
  final bool? disable;
  @JsonKey(name: "free")
  final bool? free;
  @JsonKey(name: "balanceFromUser")
  final int? balanceFromUser;
  @JsonKey(name: "totalBalanceFromUser")
  final int? totalBalanceFromUser;
  @JsonKey(name: "totalBalanceToUser")
  final int? totalBalanceToUser;

  CashInConfirmModelDTO({
    this.id,
    this.requestAmount,
    this.amount,
    this.fee,
    this.vat,
    this.discount,
    this.name,
    this.type,
    this.bankCode,
    this.transferType,
    this.transferCode,
    this.feeType,
    this.content,
    this.status,
    this.createDate,
    this.updateDate,
    this.refId,
    this.parentId,
    this.plus,
    this.icon,
    this.method,
    this.data,
    this.redirectUrl,
    this.order,
    this.fromUserId,
    this.toUserId,
    this.fromUserBalance,
    this.toUserBalance,
    this.linkBanks,
    this.total,
    this.typeName,
    this.completed,
    this.statusName,
    this.disable,
    this.free,
    this.balanceFromUser,
    this.totalBalanceFromUser,
    this.totalBalanceToUser,
  });


  static CashInConfirmModelDTO fromResult(dynamic data) =>
      CashInConfirmModelDTO.fromJson(data as Map<String, dynamic>);

  factory CashInConfirmModelDTO.fromJson(dynamic json) =>
      _$CashInConfirmModelDTOFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$CashInConfirmModelDTOToJson(this);
}

@JsonSerializable()
class BankModelDTO {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "code")
  final String? code;
  @JsonKey(name: "imageUrl")
  final String? imageUrl;
  @JsonKey(name: "branchName")
  final String? branchName;
  @JsonKey(name: "accountNo")
  final String? accountNo;
  @JsonKey(name: "accountName")
  final String? accountName;
  @JsonKey(name: "va")
  final bool? va;

  BankModelDTO({
    this.id,
    this.name,
    this.code,
    this.imageUrl,
    this.branchName,
    this.accountNo,
    this.accountName,
    this.va,
  });

  factory BankModelDTO.fromJson(dynamic json) =>
      _$BankModelDTOFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$BankModelDTOToJson(this);
}

extension CashInModeMapper on CashInConfirmModelDTO {
  CashInConfirmModel toModel() {
    return CashInConfirmModel(state: id, contractLink: name);
  }
}
