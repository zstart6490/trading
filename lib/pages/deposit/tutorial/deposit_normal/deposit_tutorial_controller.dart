import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/utils/util.dart';

class TDDepositeTutorialController extends BaseController {
  late List<String> imgList;
  late List<String> titles;
  late List<String> descs;
  late PageController pageController;
  RxInt currentPage = 0.obs;

  RxBool showSkipBtn = true.obs;

  @override
  void onInit() {
    imgList = [
      "assets/images/png/deposite_step_1.png",
      "assets/images/png/deposite_step_2.png",
      "assets/images/png/deposite_step_3.png",
    ];
    descs = [
      "Sao chép số tài khoản và \nnội dung chuyển khoản sau",
      "Mở app ngân hàng của bạn và vào mục \nchuyển khoản ngân hàng",
      "Chọn đúng ngân hàng của Tikop. Dán hoặc nhập chính xác số tài khoản, số tiền và nội dung chuyển khoản để gửi tiền cho Tikop"
    ];
    pageController = PageController();
    super.onInit();
  }

  void onPageChanged(int page) {
    currentPage.value = page;
    showSkipBtn.value = page != imgList.length - 1;
  }

  void onNext() {
    if (currentPage.value == imgList.length - 1) {
      Get.back();
    } else {
      nextPage();
    }
  }

  void backPage() {
    pageController.previousPage(duration: DUR_250, curve: Curves.ease);
  }

  void skip() {
    Get.back();
  }

  void nextPage() {
    pageController.nextPage(duration: DUR_250, curve: Curves.ease);
  }
}
