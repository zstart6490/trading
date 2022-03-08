import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/pages/contract/user_use_case.dart';

class ContractController extends BaseController {
  RxString urlPdf = "".obs;
  final UserUseCase _userUseCase = Get.find();


  @override
  void onInit() {
    getContractUser();
    super.onInit();
  }


  Future getContractUser() async {
    final linkPdf = await _userUseCase.getContractUser("");
    if (kDebugMode) {
      print(urlPdf.value );
    }
  }
}
