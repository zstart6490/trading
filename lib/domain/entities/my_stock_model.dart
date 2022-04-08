class MyStockModel {
  final int? id;
  final String? productKey;
  final double quantity;
  final double priceAvg;
  final double? amount;
  final double quantityWaitingReturn;
  final double dividendsWaitingReturn;
  final List<PortfolioModel>? portfolioHistoryList;

  MyStockModel({
    this.id,
    this.productKey,
    required this.quantity,
    required this.priceAvg,
    this.amount,
    required this.quantityWaitingReturn,
    required this.dividendsWaitingReturn,
    this.portfolioHistoryList,
  });
}


class PortfolioModel{
  final int? id;
  final String? productKey;
  final double? price;
  final double? quantity;

  PortfolioModel({
    this.id,
    this.productKey,
    this.price,
    this.quantity,
  });
}