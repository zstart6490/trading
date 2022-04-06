import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/domain/entities/stock_order_info.dart';
import 'package:trading_module/domain/entities/stock_transaction_detail.dart';
import 'package:trading_module/domain/repos/stock_exchange_repo.dart';

class StockExchangeUseCase {
  final StockExchangeRepo _stockRepo;

  StockExchangeUseCase(this._stockRepo);

  Future<DataState<StockOrderInfo>> getBuyOrderInfo(
      {required String symbol,
      required double price,
      required int quantity}) async {
    final otp = await _stockRepo.getBuyOrderInfo(
        symbol: symbol, price: price, quantity: quantity);
    return otp;
  }

  Future<DataState<StockOrderInfo>> getSellOrderInfo(
      {required String symbol,
      required double price,
      required int quantity}) async {
    final otp = await _stockRepo.getSellOrderInfo(
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
}
