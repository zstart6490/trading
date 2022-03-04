import 'package:get/get.dart';
import 'package:trading_module/domain/entities/data_login.dart';
import 'package:trading_module/pages/on_boarding/intro/intro_controller.dart';

class IntroBinding extends Bindings {
  @override
  void dependencies() {
    final params = Get.arguments as List;
    final DataLogin? dataLogin = params[0]['data_login'] as DataLogin?;

    Get.lazyPut(() => IntroController(
        dataLogin: dataLogin));
  }
}
