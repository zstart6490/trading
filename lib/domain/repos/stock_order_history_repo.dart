import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/domain/entities/list_order_transaction.dart';
import 'package:trading_module/domain/entities/stock_transaction_detail.dart';

abstract class StockOrderHistoryRepo {

  Future<DataState<ListOrderTransaction>> getListOrder(
      {required String orderType,required int page,required int limit});

  Future<DataState<StockTransactionDetail>> getOrderDetail({required int id});
}
