import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/cores/api_services.dart';
import 'package:trading_module/cores/networking/decoder.dart';
import 'package:trading_module/data/entities/my_stock_model_dto.dart';
import 'package:trading_module/data/entities/stock_order_info_dto.dart';
import 'package:trading_module/data/entities/stock_transaction_detail_dto.dart';

abstract class StockExchangeService extends ApiServices {
  StockExchangeService() : super();

  Future<BaseDecoder<StockOrderInfoDto>> getBuyOrderInfo(String symbol,double price,int quantity,);
  Future<BaseDecoder<StockTransactionDetailDto>> confirmBuyOrderInfo(String symbol,double price,int quantity,);
  Future<BaseDecoder<StockTransactionDetailDto>> confirmSellOrderInfo(String symbol,double price,int quantity,);
  Future<BaseDecoder<StockOrderInfoDto>> getSellOrderInfo(String symbol,double price,int quantity,);
  Future<BaseDecoder<MyStockModelDTO>> getStockDetail(String stock);
  Future<BaseDecoder<MyStockModelDTO>> addFollowing(String stock, String type, {bool isFlow=false});
}

class StockExchangeServiceImpl extends StockExchangeService {
  StockExchangeServiceImpl() : super();

  @override
  Future<BaseDecoder<StockOrderInfoDto>> getBuyOrderInfo(String symbol,double price,int quantity) async {
    return  BaseDecoder(await api.postData(
        endPoint: "/order/v1/buy/create",
        params: {
          'symbol':symbol,
          'price':price,
          'quantity':quantity,
        },
        timeOut: AppConstants.TIME_OUT),
    decoder: StockOrderInfoDto.fromJson);
  }

  @override
  Future<BaseDecoder<StockOrderInfoDto>> getSellOrderInfo(String symbol, double price, int quantity) async{
    return  BaseDecoder(await api.postData(
        endPoint: "/order/v1/sell/create",
        params: {
          'symbol':symbol,
          'price':price,
          'quantity':quantity,
        },
        timeOut: AppConstants.TIME_OUT),
    decoder: StockOrderInfoDto.fromJson);
  }

  @override
  Future<BaseDecoder<StockTransactionDetailDto>> confirmBuyOrderInfo(String symbol, double price, int quantity) async{
    return  BaseDecoder(await api.postData(
        endPoint: "/order/v1/buy/confirm",
        params: {
          'symbol':symbol,
          'price':price,
          'quantity':quantity,
        },
        timeOut: AppConstants.TIME_OUT),
    decoder: StockTransactionDetailDto.fromJson);
  }

  @override
  Future<BaseDecoder<StockTransactionDetailDto>> confirmSellOrderInfo(String symbol, double price, int quantity) async{
    return  BaseDecoder(await api.postData(
        endPoint: "/order/v1/sell/confirm",
        params: {
          'symbol':symbol,
          'price':price,
          'quantity':quantity,
        },
        timeOut: AppConstants.TIME_OUT),
        decoder: StockTransactionDetailDto.fromJson);
  }

  @override
  Future<BaseDecoder<MyStockModelDTO>> getStockDetail(String stock) async{
    return  BaseDecoder(await api.getData(
        endPoint: "/order/v1/stock/detail",
        params: {
          "productKey":stock,
        },
        timeOut: AppConstants.TIME_OUT),
        decoder: MyStockModelDTO.fromJson);
  }

  @override
  Future<BaseDecoder<MyStockModelDTO>> addFollowing(String stock, String type, {bool isFlow=false}) async{
    return  BaseDecoder(await api.postData(
        endPoint: "/account/v1/stock/watching/update",
        params: {
          "isDelete": isFlow,
          "productKey":stock,
          "productType":type,
        },
        timeOut: AppConstants.TIME_OUT),
        decoder: MyStockModelDTO.fromJson);
  }

}
