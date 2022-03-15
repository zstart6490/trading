import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/data/entities/kyc_status.dart';
import 'package:trading_module/domain/entities/data_login.dart';
import 'package:trading_module/domain/use_cases/user_onboarding_usecase.dart';
import 'package:trading_module/routes/app_routes.dart';

class MainController extends BaseController {
  final UserOnBoardingUseCase _boardingUseCase =
      Get.find<UserOnBoardingUseCase>();

  @override
  void onInit() {
    // getDataLogin();
    super.onInit();
  }

  /// .This api will return: 1. if not register yet, return register screen 2.
  /// if register and not by-pass on-boarding yet,
  /// return current status of on-boarding 3. if by-pass on-boarding screen, return HOME screen
  Future getDataLogin() async {
    showProgressingDialog();
    final dataInput = mainProvider.dataInputApp;
    //check token
    final accessToken = mainProvider.accessToken;
    if (accessToken != null && mainProvider.userData != null) {
      hideDialog();
      if (kDebugMode) {
        print("TradingToken=$accessToken");
      }
      Get.toNamed(AppRoutes.homeTrading);
    } else {
      final respData = await _boardingUseCase.getDataLoginUser(
        token: dataInput.token,
        fbDeviceId: dataInput.fbDeviceId ?? "",
        kyc: dataInput.userIsRegisteredKyc == KycStatus.verified ? "y" : "n",
      );
      hideDialog();
      if (respData.data != null) {
        final DataLogin? dataLogin = respData.data;
        if (dataLogin?.nextScreen == "REGISTER") {
          Get.offAndToNamed(AppRoutes.boardingIntro, arguments: [
            {
              'data_login': dataLogin,
            }
          ]);
        } else if (dataLogin?.nextScreen == "CONFIRM") {
          mainProvider.callToActiveOTP?.call();
        } else if (dataLogin?.nextScreen == "HOME") {
          //To Home
          mainProvider.accessToken = dataLogin?.token;
          mainProvider.userData = dataLogin?.userData;
          mainProvider.configMap = dataLogin?.configMap;
          Get.toNamed(AppRoutes.homeTrading);
        }
      } else {
        if (respData.error != null) {
          handleErrorResponse(respData.error);
        }
      }
    }
  }

  Future refreshToken(Function() callBack) async {
    showProgressingDialog();
    final dataInput = mainProvider.dataInputApp;
    final respData = await _boardingUseCase.getDataLoginUser(
      token: dataInput.token,
      fbDeviceId: dataInput.fbDeviceId ?? "",
      kyc: dataInput.userIsRegisteredKyc == KycStatus.verified ? "y" : "n",
    );
    hideDialog();
    if (respData.data != null) {
      if (respData.data?.token != null) {
        mainProvider.accessToken = respData.data?.token;
        mainProvider.box.write(AUTH_TOKEN_KEY, respData.data?.token);
      }
    }
  }
}
