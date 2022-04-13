import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/domain/entities/stock_history_price_model.dart';


abstract class StockMarketRepo {

  Future<DataState<List<StockHistoryPriceModel>>> getHistoryStockPrice({
    required String symbol,
    required String type,
  });

}