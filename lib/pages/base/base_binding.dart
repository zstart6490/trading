import 'package:get/get.dart';
import 'package:trading_project/pages/base/main_provider.dart';



class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainProvider());
  }
}
