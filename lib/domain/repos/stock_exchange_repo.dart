import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/domain/entities/my_stock_model.dart';
import 'package:trading_module/domain/entities/stock_order_info.dart';
import 'package:trading_module/domain/entities/stock_transaction_detail.dart';

abstract class StockExchangeRepo {
  Future<DataState<StockOrderInfo>> createBuyOrderInfo(
      {required String symbol, required double price, required int quantity});

  Future<DataState<StockTransactionDetail>> confirmBuyOrder(
      {required String symbol, required double price, required int quantity});

  Future<DataState<StockTransactionDetail>> confirmSellOrder(
      {required String symbol, required double price, required int quantity});

  Future<DataState<StockOrderInfo>> createSellOrderInfo(
      {required String symbol, required double price, required int quantity});

  Future<DataState<MyStockModel>> getStockDetail({
    required String stock,
  });

  Future<DataState<MyStockModel>> addFollowing({
    required bool isFlow,
    required String stock,
    required String type,
  });

}
