import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_project/cores/states/base_controller.dart';
import 'package:trading_project/routes/app_pages.dart';

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
      Get.toNamed(Routes.SMART_OPT_CONFIRM);
    }
  }
}
