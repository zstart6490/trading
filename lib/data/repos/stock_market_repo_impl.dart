import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/data/entities/stock_history_price_model_dto.dart';
import 'package:trading_module/data/services/stock_market_service.dart';
import 'package:trading_module/data/services/stock_service.dart';
import 'package:trading_module/domain/entities/stock_history_price_model.dart';
import 'package:trading_module/domain/repos/stock_maket_repo.dart';


class StockMarketRepoImpl extends StockMarketRepo {
  final StockMarketService _services;

  StockMarketRepoImpl(this._services);


  @override
  Future<DataState<List<StockHistoryPriceModel>>> getHistoryStockPrice({required String symbol, required String type}) async{
    final result = await _services.getHistoryStockPrice(symbol, type);
    if (result.success) {
      final model = result.modelDTO;
      final List<StockHistoryPriceModel> list =[];
      for (final value in model) {
        list.add(value.toModel());
      }
      return DataSuccess<List<StockHistoryPriceModel>>(list);
    }
    return DataFailed(result.error);
  }

}
