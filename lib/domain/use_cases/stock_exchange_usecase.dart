import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/domain/entities/my_stock_model.dart';
import 'package:trading_module/domain/entities/stock_order_info.dart';
import 'package:trading_module/domain/entities/stock_transaction_detail.dart';
import 'package:trading_module/domain/repos/stock_exchange_repo.dart';

class StockExchangeUseCase {
  final StockExchangeRepo _stockRepo;

  StockExchangeUseCase(this._stockRepo);

  Future<DataState<StockOrderInfo>> createBuyOrderInfo(
      {required String symbol,
      required double price,
      required int quantity}) async {
    final otp = await _stockRepo.createBuyOrderInfo(
        symbol: symbol, price: price, quantity: quantity);
    return otp;
  }

  Future<DataState<StockOrderInfo>> createSellOrderInfo(
      {required String symbol,
      required double price,
      required int quantity}) async {
    final otp = await _stockRepo.createSellOrderInfo(
        symbol: symbol, price: price, quantity: quantity);
    return otp;
  }

  Future<DataState<StockTransactionDetail>> confirmBuyOrderInfo(
      {required String symbol,
        required double price,
        required int quantity}) async {
    final otp = await _stockRepo.confirmBuyOrder(
        symbol: symbol, price: price, quantity: quantity);
    return otp;
  }

  Future<DataState<StockTransactionDetail>> confirmSellOrderInfo(
      {required String symbol,
        required double price,
        required int quantity}) async {
    final otp = await _stockRepo.confirmSellOrder(
        symbol: symbol, price: price, quantity: quantity);
    return otp;
  }

  Future<DataState<MyStockModel>> getStockDetail({required String symbol}) async {
    final result = await _stockRepo.getStockDetail(stock: symbol);
    return result;
  }

  Future<DataState<MyStockModel>> addFollowing({ required String stock, required String type, required bool isFlow}) async {
    final result = await _stockRepo.addFollowing(stock:stock, type: type, isFlow: isFlow);
    return result;
  }

}
