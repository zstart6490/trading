import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/domain/entities/stock_current_price_model.dart';
import 'package:trading_module/domain/entities/stock_history_price_model.dart';
import 'package:trading_module/domain/entities/stock_model.dart';


abstract class StockRepo {

  Future<DataState<List<StockModel>>> getList();

  Future<DataState<StockCurrentPriceModel>> getCurrentStockPrice({
    required String symbol,
  });

  Future<DataState<List<StockHistoryPriceModel>>> getHistoryStockPrice({
    required String symbol,
    required String type,
  });

  Future<DataState<List<StockModel>>> getInfoListStock({
    required List<String> stocks,
  });


}