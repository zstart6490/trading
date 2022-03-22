import 'dart:developer';

import 'package:get/get.dart';
import 'package:trading_module/data/entities/naptien/NavigateData.dart';
import 'package:trading_module/data/repos/cash_in_repo_impl.dart';
import 'package:trading_module/data/services/cash_in_service.dart';
import 'package:trading_module/domain/entities/cash_in_create_model.dart';
import 'package:trading_module/domain/repos/cash_in_repo.dart';
import 'package:trading_module/domain/use_cases/cash_in_usecase.dart';


import 'transaction_confirm_controller.dart';

class TDTransactionConfirmBinding extends Bindings {
  @override
  void dependencies() {
    final arg = Get.arguments;
    if (arg is int) {
      Get.lazyPut<CashInRepo>(() => CashInRepoImpl(CashInServiceImpl()));
      Get.lazyPut<CashInUseCase>(() => CashInUseCase(Get.find()));
      Get.lazyPut(() => TDTransactionConfirmController(arg));
    } else {
      log("Navigate Error");
    }
  }
}
