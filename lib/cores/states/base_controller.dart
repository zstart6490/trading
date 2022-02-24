
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_project/cores/states/base_common_widget.dart';

abstract class BaseController extends GetxController
    with _ScaffoldInterface, BaseCommonWidgets {

  // MainProvider get mainProvider => GetInstance().find<MainProvider>();
  //
  // PetRepository get petRepository => PetRepository();



  bool isLogged (){
    return true;
  }

  void requestLogin(){

  }



  Future<void> loginFaceBook() async {

  }

  void loginGoogle() {

  }

  void handleLoginFacebook() async {

  }


  Future<void> loginBackend(String token) async {

  }

  void saveDataLocal() {

  }

  @override
  Future<bool> onWillPop() {
    return Future.value(true);
  }

  @override
  void hideKeyboard() {
    if (kDebugMode) log("hideKeyboard");
    Get.focusScope?.unfocus();
  }



  void backToHome({int selectTab = 0}) {
    // Get.until((route) => Get.currentRoute == Routes.home);
    // Get.find<MainTabController>().selTab(selectTab);
  }


}




abstract class _CommonWidgetsInterface {
  void showProgressingDialog();

  void showSnackBar(String message);

  void showAlertDialog(Widget dialog,
      {bool dismissable = true, Function onCompleted});

  void bottomSheet(Widget bottomSheet);

  void hideDialog();

  void showDialogPickImage();
}

abstract class _ScaffoldInterface {
  Future<bool> onWillPop();

  void hideKeyboard();
}
