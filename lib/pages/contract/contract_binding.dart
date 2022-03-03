import 'package:get/get.dart';
import 'package:trading_module/pages/contract/contract_controller.dart';

class ContractBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContractController>(() => ContractController());
  }
}
