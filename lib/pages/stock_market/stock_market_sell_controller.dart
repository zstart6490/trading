import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/pages/history_share_transaction/transaction_model.dart';

class StockMarketSellController extends BaseController  with StateMixin<List<TransactionModel>>  {

  final list_share = List<TransactionModel>.filled(5, new TransactionModel("ABC","456","3","oke oke"));

  @override
  void onInit() {
    super.onInit();

  }

}
