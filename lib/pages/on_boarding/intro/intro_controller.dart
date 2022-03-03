import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/domain/entities/data_login.dart';
import 'package:trading_module/kyc/kyc_callback.dart';
import 'package:trading_module/routes/app_pages.dart';
import 'package:trading_module/routes/app_routes.dart';

class IntroController extends BaseController with StateMixin<MsgMap> {
  final KycStatus userIsRegisteredKyc;
  final bool userIsRegisteredOTP;
  final DataLogin? dataLogin;

  IntroController(
      {required this.userIsRegisteredKyc,
      required this.userIsRegisteredOTP,
      this.dataLogin});

  @override
  void onInit() {
    super.onInit();
    bindData();
  }

  void bindData() {
    change(null, status: RxStatus.loading());
    if (dataLogin != null) {
      if (dataLogin?.msgMap != null) {
        change(dataLogin?.msgMap, status: RxStatus.success());
      } else {
        change(dataLogin?.msgMap,
            status: RxStatus.error("Data Content Loading Error!"));
      }
    }
  }

  void toAcceptTerm() {
    Get.toNamed(AppRoutes.BOARDING_VERIFY_POLICY, arguments: [
      {
        'data_login': dataLogin,
        'user_kyc': userIsRegisteredKyc,
        'user_otp': userIsRegisteredOTP,
      }
    ]);
  }
}
