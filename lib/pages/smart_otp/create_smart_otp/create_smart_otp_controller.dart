import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/routes/app_pages.dart';
import 'package:trading_module/routes/app_routes.dart';

class CreateSmartOTPController extends BaseController {
  late TextEditingController textEditingController;
  late FocusNode focusNode;


  @override
  void onInit() {
    super.onInit();
    textEditingController = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void hideKeyboard() {
    //Không cho ẩn bàn phím
    //super.hideKeyboard();
  }

  Future<void> onChange(String pin) async {
    if (pin.length == 4) {
      Get.toNamed(AppRoutes.SMART_OPT_CONFIRM);
    }
  }
}
