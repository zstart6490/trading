import 'package:get/get.dart';
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
    final dataInput =mainProvider.dataInputApp;
    final respData = await _boardingUseCase.getDataLoginUser(
      token:dataInput.token,
      fbDeviceId: dataInput.fbDeviceId??"",
      kyc: dataInput.userIsRegisteredKyc == KycStatus.verified
          ? "y"
          : "n",
    );
    if (respData.data != null) {
      final DataLogin? dataLogin = respData.data;
      if (respData.data?.nextScreen == "REGISTER") {
        Get.offAndToNamed(AppRoutes.BOARDING_INTRO, arguments: [
          {
            'data_login': dataLogin,
          }
        ]);
      } else {
        //To Home
        // var userData = dataLogin?.userData;
      }
    }
  }
}
