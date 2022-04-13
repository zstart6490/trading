import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/cores/market_api_services.dart';
import 'package:trading_module/cores/networking/decoder.dart';
import 'package:trading_module/data/entities/stock_history_price_model_dto.dart';


abstract class StockMarketService extends MarketApiServices {
  StockMarketService() : super();

  Future<BaseDecoder<List<StockHistoryPriceModelDTO>>> getHistoryStockPrice(String symbol, String type);
}

class StockMarketServiceImpl extends StockMarketService {
  StockMarketServiceImpl() : super();


  @override
  Future<BaseDecoder<List<StockHistoryPriceModelDTO>>> getHistoryStockPrice(String symbol, String type) async{
    return  BaseDecoder(await api.postData(
        endPoint: "/stock-price/v1/history/$symbol",
        params: {
          'type':type,
        },
        timeOut: AppConstants.TIME_OUT),
        decoder: StockHistoryPriceModelDTO.getList);
  }

}
