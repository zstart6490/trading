import 'package:get/get.dart';
import 'package:trading_module/domain/entities/property_model.dart';
import 'package:trading_module/utils/extensions.dart';

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

  double getStateProfitLoss() {
    double totalGrowth = 0;
    if (stockList != null) {
      for (final item in stockList!) {
        totalGrowth += ((item.priceAvg ?? 0) - (item.lastPrice ?? 0))  * (item.quantity ?? 0);
      }
    }
    return totalGrowth;
  }

  double getTotalProperty() {
    final double totalPrice = getTotalPropertyStock();
    return totalPrice + (cashBalance ?? 0) + (balanceWaitingReturn ?? 0) + (balancePay ?? 0);
  }

  double getTotalPropertyStock() {
    double totalGrowth = 0;
    double totalOrigin = 0;
    if (stockList != null) {
      for (final item in stockList!) {
        totalGrowth += ((item.priceAvg ?? 0) - (item.lastPrice ?? 0))  * (item.quantity ?? 0);
        totalOrigin += (item.priceAvg ?? 0)  * (item.quantity ?? 0);
      }
    }

    return totalOrigin + totalGrowth;
  }

  String getTotalGrowth() {
    double totalGrowth = 0;
    double totalOrigin = 0;
    if (stockList != null) {
      for (final item in stockList!) {
        totalGrowth += ((item.priceAvg ?? 0) - (item.lastPrice ?? 0))  * (item.quantity ?? 0);
        totalOrigin += (item.priceAvg ?? 0)  * (item.quantity ?? 0);
      }
    }

    final percent = (totalGrowth / totalOrigin)*100;
    var sPercent = "0%";
    if (!percent.isNaN && !percent.isInfinite) {
       sPercent = percent > 0 ? "+${percent.toPrecision(2)}%" : "${percent.toPrecision(2)}%";
    }

    final sTotalGrowth = totalGrowth > 0 ? "+${totalGrowth.toCurrency()}" : totalGrowth.toCurrency();
    return "$sTotalGrowth ($sPercent)";
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
