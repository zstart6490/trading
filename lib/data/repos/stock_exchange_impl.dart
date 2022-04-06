import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/data/entities/stock_order_info_dto.dart';
import 'package:trading_module/data/entities/stock_transaction_detail_dto.dart';
import 'package:trading_module/data/services/stock_exchange_service.dart';
import 'package:trading_module/domain/entities/stock_order_info.dart';
import 'package:trading_module/domain/entities/stock_transaction_detail.dart';
import 'package:trading_module/domain/repos/stock_exchange_repo.dart';

class StockExchangeRepoImpl extends StockExchangeRepo {
  final StockExchangeService _services;

  StockExchangeRepoImpl(this._services);

  @override
  Future<DataState<StockOrderInfo>> getBuyOrderInfo(
      {required String symbol,
      required double price,
      required int quantity}) async {
    final result = await _services.getBuyOrderInfo(symbol, price, quantity);
    if (result.success) {
      final model = result.modelDTO.toModel();
      return DataSuccess(model);
    }
    return DataFailed(result.error);
  }

  @override
  Future<DataState<StockOrderInfo>> getSellOrderInfo(
      {required String symbol,
      required double price,
      required int quantity}) async {
    final result = await _services.getSellOrderInfo(symbol, price, quantity);
    if (result.success) {
      final model = result.modelDTO.toModel();
      return DataSuccess(model);
    }
    return DataFailed(result.error);
  }



  @override
  Future<DataState<StockTransactionDetail>> confirmSellOrder({required String symbol, required double price, required int quantity}) async{
    final result = await _services.confirmSellOrderInfo(symbol, price, quantity);
    if (result.success) {
      final model = result.modelDTO.toModel();
      return DataSuccess(model);
    }
    return DataFailed(result.error);

  }

  @override
  Future<DataState<StockTransactionDetail>> confirmBuyOrder({required String symbol, required double price, required int quantity}) async{
    final result = await _services.confirmBuyOrderInfo(symbol, price, quantity);
    if (result.success) {
      final model = result.modelDTO.toModel();
      return DataSuccess(model);
    }
    return DataFailed(result.error);
  }
}
