import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/data/entities/list_order_transaction_dto.dart';
import 'package:trading_module/data/entities/stock_transaction_detail_dto.dart';
import 'package:trading_module/data/services/stock_order_service.dart';
import 'package:trading_module/domain/entities/list_order_transaction.dart';
import 'package:trading_module/domain/entities/stock_transaction_detail.dart';
import 'package:trading_module/domain/repos/stock_order_history_repo.dart';

class StockOrderHistoryRepoImpl extends StockOrderHistoryRepo {
  final StockOrderService _services;

  StockOrderHistoryRepoImpl(this._services);

  @override
  Future<DataState<ListOrderTransaction>> getListOrder({required String orderType, required int page, required int limit}) async{
    final result = await _services.getListOrder(orderType, page, limit);
    if (result.success) {
      final model = result.modelDTO.toModel();
      return DataSuccess(model);
    }
    return DataFailed(result.error);
  }

  @override
  Future<DataState<StockTransactionDetail>> getOrderDetail({required int id}) async{
    final result = await _services.getOrderDetail(id);
    if (result.success) {
      final model = result.modelDTO.toModel();
      return DataSuccess(model);
    }
    return DataFailed(result.error);
  }
}
