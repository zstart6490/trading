import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/cores/api_services.dart';
import 'package:trading_module/cores/networking/decoder.dart';
import 'package:trading_module/data/entities/stock_order_info_dto.dart';
import 'package:trading_module/data/entities/stock_transaction_detail_dto.dart';

abstract class StockExchangeService extends ApiServices {
  StockExchangeService() : super();

  Future<BaseDecoder<StockOrderInfoDto>> getBuyOrderInfo(String symbol,double price,int quantity,);
  Future<BaseDecoder<StockTransactionDetailDto>> confirmBuyOrderInfo(String symbol,double price,int quantity,);
  Future<BaseDecoder<StockTransactionDetailDto>> confirmSellOrderInfo(String symbol,double price,int quantity,);
  Future<BaseDecoder<StockOrderInfoDto>> getSellOrderInfo(String symbol,double price,int quantity,);
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
}
