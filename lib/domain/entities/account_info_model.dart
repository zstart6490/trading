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
  final double? growthValue;
  final double? growthPercent;
  final double? totalAmountPortfolio;
  final double? totalAsset;

  AccountInfoModel({
    required this.stockList,
    required this.pendingTransactions,
    required this.productWatchingVOList,
    required this.cashBalance,
    required this.balanceWaitingReturn,
    required this.balancePay,
    required this.growthValue,
    required this.growthPercent,
    required this.totalAmountPortfolio,
    required this.totalAsset,
  });

  double getStateProfitLoss() {
    double totalGrowth = 0;
    if (stockList != null) {
      for (final item in stockList!) {
        totalGrowth += ((item.lastPrice ?? 0) - (item.priceAvg ?? 0)) *
            (item.quantity ?? 0);
      }
    }
    return totalGrowth;
  }

  int getTotalProperty() {
    final int totalPrice = getTotalPropertyStock();
    return totalPrice +
        ((cashBalance ?? 0) +
        (balanceWaitingReturn ?? 0) +
        (balancePay ?? 0)).toInt();
  }

  int getTotalPropertyStock() {
    double totalGrowth = 0;
    double totalOrigin = 0;
    if (stockList != null) {
      for (final item in stockList!) {
        totalGrowth += (item.lastPrice ?? 0) * (item.quantity ?? 0);
        totalOrigin += (item.priceAvg ?? 0) * (item.quantity ?? 0);
      }
    }

    return (totalOrigin + (totalGrowth - totalOrigin)).toInt();
  }

  double getPercentGrowth() {
    double totalGrowth = 0;
    double totalOrigin = 0;
    if (stockList != null) {
      for (final item in stockList!) {
        totalGrowth += (item.lastPrice ?? 0) * (item.quantity ?? 0);
        totalOrigin += (item.priceAvg ?? 0) * (item.quantity ?? 0);
      }
    }

    final percent = ((totalGrowth - totalOrigin) / totalOrigin) * 100;
    return percent;
  }

  String getTotalGrowth() {
    double totalValueCurrent = 0;
    double totalOrigin = 0;

    if (stockList != null) {
      for (final item in stockList!) {
        totalValueCurrent += (item.lastPrice ?? 0) * (item.quantity ?? 0);
        totalOrigin += (item.priceAvg ?? 0) * (item.quantity ?? 0);
      }
    }

    final totalGrowth = totalValueCurrent - totalOrigin;
    final percent = (totalGrowth / totalOrigin) * 100;
    var sPercent = "0%";
    if (!percent.isNaN && !percent.isInfinite) {
      sPercent = percent > 0
          ? "+${percent.toPrecision(2)}%".replaceAll(".", ",")
          : "${percent.toPrecision(2)}%".replaceAll(".", ",");
    }

    final sTotalGrowth = totalGrowth > 0
        ? "+${totalGrowth.toInt().toCurrency()}"
        : totalGrowth.toInt().toCurrency();
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
