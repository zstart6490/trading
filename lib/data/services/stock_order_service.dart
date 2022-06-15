import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/cores/api_services.dart';
import 'package:trading_module/cores/networking/decoder.dart';
import 'package:trading_module/data/entities/list_order_transaction_dto.dart';
import 'package:trading_module/data/entities/my_stock_model_dto.dart';
import 'package:trading_module/data/entities/stock_order_info_dto.dart';
import 'package:trading_module/data/entities/stock_transaction_detail_dto.dart';

abstract class StockOrderService extends ApiServices {
  StockOrderService() : super();

  Future<BaseDecoder<StockOrderInfoDto>> createBuyOrderInfo(String symbol,double price,int quantity,);
  Future<BaseDecoder<StockTransactionDetailDto>> confirmBuyOrderInfo(String symbol,double price,int quantity,);
  Future<BaseDecoder<StockTransactionDetailDto>> confirmSellOrderInfo(String symbol,double price,int quantity,);
  Future<BaseDecoder<StockOrderInfoDto>> getSellOrderInfo(String symbol,double price,int quantity,);
  Future<BaseDecoder<MyStockModelDTO>> getStockDetail(String stock);
  Future<BaseDecoder<MyStockModelDTO>> addFollowing(String stock, String type, {bool isFlow=false});
  Future<BaseDecoder<ListOrderTransactionDto>> getListOrder(String orderType,int page,int limit,);
  Future<BaseDecoder<StockTransactionDetailDto>> getOrderDetail(int id);
}

class StockOrderServiceImpl extends StockOrderService {
  StockOrderServiceImpl() : super();

  @override
  Future<BaseDecoder<StockOrderInfoDto>> createBuyOrderInfo(String symbol,double price,int quantity) async {
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
          "isFollowed": isFlow,
          "productKey":stock,
          "productType":type,
        },
        timeOut: AppConstants.TIME_OUT),
        decoder: MyStockModelDTO.fromJson);
  }


  @override
  Future<BaseDecoder<ListOrderTransactionDto>> getListOrder(String orderType, int page, int limit) async{
    return  BaseDecoder(await api.getData(
        endPoint: "/order/v1/list",
        params: {
          'orderType':orderType,
          'page':page.toString(),
          'limit':limit.toString(),
        },
        timeOut: AppConstants.TIME_OUT),
    decoder: ListOrderTransactionDto.fromJson);
  }

  @override
  Future<BaseDecoder<StockTransactionDetailDto>> getOrderDetail(int id) async{
    return  BaseDecoder(await api.getData(
        endPoint: "/order/v1/detail",
        params: {
          'id':id.toString(),
        },
        timeOut: AppConstants.TIME_OUT),
    decoder: StockTransactionDetailDto.fromJson);
  }
}
