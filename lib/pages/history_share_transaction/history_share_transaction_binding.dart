import 'package:get/get.dart';
import 'package:trading_module/pages/history_share_transaction/history_share_transaction_controller.dart';

class HistoryShareTransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HistoryShareTransactionController());
  }
}
