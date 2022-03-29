import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/cores/market_api_services.dart';
import 'package:trading_module/cores/networking/decoder.dart';
import 'package:trading_module/data/entities/stock_model_dto.dart';


abstract class StockService extends MarketApiServices {
  StockService() : super();

  Future<BaseDecoder<List<StockModelDTO>>> getList();
  Future<BaseDecoder<StockModelDTO>> subscribe(List<String> stocks);
}

class StockServiceImpl extends StockService {
  StockServiceImpl() : super();

  @override
  Future<BaseDecoder<List<StockModelDTO>>> getList() async{
    return  BaseDecoder(await api.getData(
        endPoint: "/stock/v1/list",
        params: {
        },
        timeOut: AppConstants.TIME_OUT),
    decoder: StockModelDTO.fromJson);
  }

  @override
  Future<BaseDecoder<StockModelDTO>> subscribe(List<String> stocks) async{
    return  BaseDecoder(await api.postData(
        endPoint: "/stock/v1/subscribe",
        params: {
          "topics":stocks,
        },
        timeOut: AppConstants.TIME_OUT),
    decoder: StockModelDTO.getList);
  }
}
