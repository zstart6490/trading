import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/domain/entities/list_order_transaction.dart';
import 'package:trading_module/domain/entities/stock_transaction_detail.dart';
import 'package:trading_module/domain/repos/stock_order_history_repo.dart';

class StockHistoryOrderUseCase {
  final StockOrderHistoryRepo _stockOrderHistoryRepo;

  StockHistoryOrderUseCase(this._stockOrderHistoryRepo);

  Future<DataState<ListOrderTransaction>> getList(
      String orderType, int page, int limit) async {
    final result = await _stockOrderHistoryRepo.getListOrder(
        orderType: orderType, page: page, limit: limit);
    return result;
  }

  Future<DataState<StockTransactionDetail>> getOrderDetail({required int id}) async{
    final result = await _stockOrderHistoryRepo.getOrderDetail(id: id);
    return result;
  }
}
