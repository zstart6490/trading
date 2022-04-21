class ProductOwn {
  final int id;
  final String productKey;
  final double quantity;
  final double priceAvg;
  final String imageUrl;
  final String catName;
  final String stockName;
  final String symbol;
  final double lastPrice;
  final double changePrice;
  final double ratioChange;
  final int stockType;

  ProductOwn({
    required this.id,
    required this.productKey,
    required this.quantity,
    required this.priceAvg,
    required this.imageUrl,
    required this.catName,
    required this.stockName,
    required this.symbol,
    required this.lastPrice,
    required this.changePrice,
    required this.ratioChange,
    required this.stockType,
  });
}
