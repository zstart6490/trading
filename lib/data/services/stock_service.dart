import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/cores/api_services.dart';
import 'package:trading_module/cores/networking/decoder.dart';
import 'package:trading_module/data/entities/stock_current_price_model_dto.dart';
import 'package:trading_module/data/entities/stock_history_price_model_dto.dart';
import 'package:trading_module/data/entities/stock_model_dto.dart';


abstract class StockService extends ApiServices {
  StockService() : super();

  Future<BaseDecoder<List<StockModelDTO>>> getList();
  Future<BaseDecoder<StockCurrentPriceModelDTO>> getCurrentStockPrice(String symbol);

  Future<BaseDecoder<List<StockModelDTO>>> getInfoListStock(List<String> stocks);
}

class StockServiceImpl extends StockService {
  StockServiceImpl() : super();

  @override
  Future<BaseDecoder<List<StockModelDTO>>> getList() async{
    return  BaseDecoder(await api.getData(
        endPoint: "/stock/v1/list",
        timeOut: AppConstants.TIME_OUT),
    decoder: StockModelDTO.getList);
  }

  @override
  Future<BaseDecoder<StockCurrentPriceModelDTO>> getCurrentStockPrice(String symbol) async{
    return  BaseDecoder(await api.getData(
        endPoint: "/stock-price/v1/current/$symbol",
        timeOut: AppConstants.TIME_OUT),
        decoder: StockCurrentPriceModelDTO.fromJson);
  }


  @override
  Future<BaseDecoder<List<StockModelDTO>>> getInfoListStock(List<String> stocks) async{
    return  BaseDecoder(await api.postData(
        endPoint: "/stock/v1/list",
        params: {
          "symbols":stocks,
        },
        timeOut: AppConstants.TIME_OUT),
    decoder: StockModelDTO.getList);
  }


}
