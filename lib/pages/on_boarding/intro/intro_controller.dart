import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/domain/entities/data_login.dart';
import 'package:trading_module/routes/app_routes.dart';

class IntroController extends BaseController with StateMixin<MsgMap> {

  final DataLogin? dataLogin;

  IntroController({this.dataLogin});

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

    //Get.toNamed(AppRoutes.SMART_OPT_VERIFY_SMS);
    Get.offAndToNamed(AppRoutes.boardingVerifyPolicy, arguments: [
      {
        'data_login': dataLogin,
      }
    ]);
  }
}
