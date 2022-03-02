import 'package:get/get.dart';
import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/domain/entities/data_login.dart';
import 'package:trading_module/domain/use_cases/user_case.dart';
import 'package:trading_module/domain/use_cases/user_onboarding_usecase.dart';
import 'package:trading_module/routes/app_pages.dart';
import 'package:trading_module/routes/app_routes.dart';

class MainController extends BaseController {
  final bool userIsRegisteredKyc;
  final bool userIsRegisteredOTP;
  DataLogin? dataLogin;
  MainController(
      {required this.userIsRegisteredKyc,
      required this.userIsRegisteredOTP,
      required this.tokenTest});

  final UserOnBoardingUseCase _boardingUseCase =
      Get.find<UserOnBoardingUseCase>();
  final String tokenTest;

  @override
  void onInit() {
    // TODO: implement onReady
    print("getDataLogin");
    // getDataLogin();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  /// .This api will return: 1. if not register yet, return register screen 2.
  /// if register and not by-pass on-boarding yet,
  /// return current status of on-boarding 3. if by-pass on-boarding screen, return HOME screen
  Future getDataLogin() async {
    var respData = await _boardingUseCase.getDataLoginUser(
        token: tokenTest, fbDeviceId: "", kyc: "n");
    if (respData.data != null) {
       dataLogin = respData.data;
      if (dataLogin?.userData != null) {
        // user đã đăng ký trading
        var userData = dataLogin?.userData;
      } else {
        //not register trading
        //open to on-boarding
        Get.offAndToNamed(AppRoutes.BOARDING_INTRO, arguments: [
          {
            'data_login': dataLogin,
            'user_kyc': userIsRegisteredKyc,
            'user_otp': userIsRegisteredOTP,
          }
        ]);
      }
    }
  }
}
