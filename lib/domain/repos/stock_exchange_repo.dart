import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/domain/entities/stock_order_info.dart';
import 'package:trading_module/domain/entities/stock_transaction_detail.dart';

abstract class StockExchangeRepo {
  Future<DataState<StockOrderInfo>> getBuyOrderInfo(
      {required String symbol, required double price, required int quantity});

  Future<DataState<StockTransactionDetail>> confirmBuyOrder(
      {required String symbol, required double price, required int quantity});

  Future<DataState<StockTransactionDetail>> confirmSellOrder(
      {required String symbol, required double price, required int quantity});

  Future<DataState<StockOrderInfo>> getSellOrderInfo(
      {required String symbol, required double price, required int quantity});
}
