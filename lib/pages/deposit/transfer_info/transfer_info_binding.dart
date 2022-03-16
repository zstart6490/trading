import 'package:get/get.dart';
// import 'package:tikop/models/NavigateData.dart';
// import 'package:tikop/modules/deposit/transfer_info/transfer_info_controller.dart';
import 'package:trading_module/data/entities/naptien/NavigateData.dart';
import 'package:trading_module/pages/deposit/transfer_info/transfer_info_controller.dart';

class TDTransferInfoBinding extends Bindings {
  @override
  void dependencies() {
    final arg = Get.arguments;
    if (arg is NavigateTransferData) {
      Get.lazyPut(() => TDTransferInfoController(data: arg));
    }
  }
}
