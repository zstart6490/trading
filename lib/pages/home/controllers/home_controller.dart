import 'package:get/get.dart';
import 'package:trading_project/domain/use_cases/user_case.dart';

class HomeController extends GetxController {
  RxInt count = 0.obs;
  ModelUseCase modelUseCase = Get.find();

  @override
  void onInit() {
    super.onInit();
    count.value = 1;
    modelUseCase.getLastSolarActivities();
  }
}
