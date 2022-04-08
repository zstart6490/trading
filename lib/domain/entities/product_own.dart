
class ProductOwn {
  final int id;
  final String productKey;
  final double quantity;
  final double priceAvg;
  final String imageUrl;
  final String catName;
  final String stockName;

  ProductOwn(
      {required this.id,
      required this.productKey,
      required this.quantity,
      required this.priceAvg,
      required this.imageUrl,
      required this.catName,
      required this.stockName});
}
