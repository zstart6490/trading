import 'package:trading_module/domain/entities/property_model.dart';

class AccountInfoModel {
  late final List<PropertyModel>? stockList;
  final List<PendingTransactionModel>? pendingTransactions;
  final List<PropertyModel>? productWatchingVOList;
  final double? cashBalance;
  final double? balanceWaitingReturn;
  final double? balancePay;

  AccountInfoModel({
    required this.stockList,
    required this.pendingTransactions,
    required this.productWatchingVOList,
    required this.cashBalance,
    required this.balanceWaitingReturn,
    required this.balancePay,
  });

  double gePriceStock() {
    double totalPrice = 0;
    if (stockList != null) {
      for (final item in stockList!) {
        totalPrice += (item.priceAvg ?? 0)  * (item.quantity ?? 0);
      }
    }
    return totalPrice;
  }

  double geTotalProperty() {
    final double totalPrice = gePriceStock();
    return totalPrice + (cashBalance ?? 0) + (balanceWaitingReturn ?? 0) + (balancePay ?? 0);
  }
}

class PendingTransactionModel {
  final String? modifyTime;
  final String? productType;
  final double? orderType;
  final double? amount;
  final double? actualAmount;

  PendingTransactionModel({
    required this.modifyTime,
    required this.productType,
    required this.orderType,
    required this.amount,
    required this.actualAmount,
  });
}
