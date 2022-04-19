import 'package:json_annotation/json_annotation.dart';
import 'package:trading_module/data/entities/property_model_dto.dart';
import 'package:trading_module/domain/entities/account_info_model.dart';
import 'package:trading_module/domain/entities/property_model.dart';

part 'account_model_dto.g.dart';

@JsonSerializable()
class AccountInfoModelDTO {
  @JsonKey(name: "stockList")
  final List<PropertyModelDTO>? stockList;
  @JsonKey(name: "pendingTransactions")
  final List<PendingTransactionModelDTO>? pendingTransactions;
  @JsonKey(name: "productWatchingVOList")
  final List<PropertyModelDTO>? productWatchingVOList;
  @JsonKey(name: "cashBalance")
  final double? cashBalance;
  @JsonKey(name: "balanceWaitingReturn")
  final double? balanceWaitingReturn;
  @JsonKey(name: "balancePay")
  final double? balancePay;

  AccountInfoModelDTO(
    this.stockList,
    this.pendingTransactions,
    this.productWatchingVOList,
    this.cashBalance,
    this.balanceWaitingReturn,
    this.balancePay,
  );

  static AccountInfoModelDTO fromResult(dynamic data) =>
      AccountInfoModelDTO.fromJson(data as Map<String, dynamic>);

  factory AccountInfoModelDTO.fromJson(dynamic json) =>
      _$AccountInfoModelDTOFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$AccountInfoModelDTOToJson(this);

  List<PendingTransactionModel> getListPortfolio() {
    final items = <PendingTransactionModel>[];
    if (pendingTransactions != null) {
      for (final item in pendingTransactions!) {
        items.add(item.toModel());
      }
    }
    return items;
  }

  List<PropertyModel> getListProductWatching() {
    final items = <PropertyModel>[];
    if (productWatchingVOList != null) {
      for (final item in productWatchingVOList!) {
        items.add(item.toModel());
      }
    }
    return items;
  }

  List<PropertyModel> getStockList() {
    final items = <PropertyModel>[];
    if (stockList != null) {
      for (final item in stockList!) {
        items.add(item.toModel());
      }
    }
    return items;
  }
}

extension AccountInfoModelMapper on AccountInfoModelDTO {
  AccountInfoModel toModel() {
    return AccountInfoModel(
      stockList: getStockList(),
      pendingTransactions: getListPortfolio(),
      productWatchingVOList: getListProductWatching(),
      cashBalance: cashBalance,
      balanceWaitingReturn: balanceWaitingReturn,
      balancePay: balancePay,
    );
  }
}

@JsonSerializable()
class PendingTransactionModelDTO {
  @JsonKey(name: "modifyTime")
  final String? modifyTime;
  @JsonKey(name: "productType")
  final String? productType;
  @JsonKey(name: "orderType")
  final double? orderType;
  @JsonKey(name: "amount")
  final double? amount;
  @JsonKey(name: "actualAmount")
  final double? actualAmount;

  PendingTransactionModelDTO(this.modifyTime, this.productType, this.orderType,
      this.amount, this.actualAmount);

  static PendingTransactionModelDTO fromResult(dynamic data) =>
      PendingTransactionModelDTO.fromJson(data as Map<String, dynamic>);

  factory PendingTransactionModelDTO.fromJson(dynamic json) =>
      _$PendingTransactionModelDTOFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$PendingTransactionModelDTOToJson(this);
}

extension PendingTransactionModelDTOMapper on PendingTransactionModelDTO {
  PendingTransactionModel toModel() {
    return PendingTransactionModel(
        modifyTime: modifyTime,
        productType: productType,
        orderType: orderType,
        amount: amount,
        actualAmount: actualAmount);
  }
}
