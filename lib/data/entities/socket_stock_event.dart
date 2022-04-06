import 'package:trading_module/data/entities/stock_price.dart';

class SocketStockEvent {
  StockPrice stockPrice;
  String id;

  //Event name
  String event;

  SocketStockEvent({required this.stockPrice, required this.id, required this.event});
}
