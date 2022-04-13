class AccountInfoModel {
  final double? stockList;
  final List<PendingTransactionModel>? pendingTransactions;
  final List<PendingTransactionModel>? productWatchingVOList;
  final double? cashBalance;

  AccountInfoModel(
      {required this.stockList,
      required this.pendingTransactions,
      required this.productWatchingVOList,
      required this.cashBalance});
}

class PendingTransactionModel {
  final String? modifyTime;
  final String? productType;
  final double? orderType;
  final double? amount;
  final double? actualAmount;

  PendingTransactionModel(
      {required this.modifyTime,
      required this.productType,
      required this.orderType,
      required this.amount,
      required this.actualAmount});
}
