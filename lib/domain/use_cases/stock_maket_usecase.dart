import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/domain/entities/stock_history_price_model.dart';
import 'package:trading_module/domain/repos/stock_maket_repo.dart';


class StockMarketUseCase {
  final StockMarketRepo _stockRepo;

  StockMarketUseCase(this._stockRepo);


  Future<DataState<List<StockHistoryPriceModel>>> getHistoryStockPrice({required String symbol, required String type}) async {
    final result = await _stockRepo.getHistoryStockPrice(symbol: symbol, type: type);
    return result;
  }

}