import 'package:flutter_packet_demo/flutter_packet_demo.dart';
import 'package:get/get.dart';
import 'package:trading_project/cores/resources/data_state.dart';
import 'package:trading_project/cores/states/base_controller.dart';
import 'package:trading_project/domain/use_cases/user_case.dart';

class HomeController extends BaseController {
  RxInt count = 0.obs;
  ModelUseCase modelUseCase = Get.find();

  @override
  void onInit() {
    super.onInit();
    count.value = 1;
    var dataState = modelUseCase.getLastSolarActivities();
    if (dataState is DataSuccess &&
        (dataState as DataSuccess).data.isNotEmpty) {
      final articles = (dataState as DataSuccess).data;
    }
    if (dataState is DataFailed) {
      final articles = (dataState as DataFailed).error;
    }

    Calculator().addOne(8);



  }
}
