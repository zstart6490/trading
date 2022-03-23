import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/domain/entities/account_info_model.dart';
import 'package:trading_module/domain/use_cases/home_trading_usecase.dart';

class HomePropertyController extends BaseController
    with StateMixin<AccountInfoModel> {
  final HomeTradingUseCase _homeTradingUseCase = Get.find();
  AccountInfoModel? accountInfoModel;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getAccountInfo();
  }

  Future<void> getAccountInfo() async {
    final result = await _homeTradingUseCase.getAccountInfo();
    if (result.data != null) {
      accountInfoModel = result.data;
      change(result.data, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.empty());
    }
  }

  void executeCommand(String cmd) {
    switch (cmd) {
      case "onTappedRank":
        //Get.find<HomeController>().onTappedRank();
        break;
      case "onTappedReferral":
        //Get.toNamed(Routes.referral);
        break;
      case "onTappedGame":
        //Get.find<HomeController>().onTappedGame();
        break;
      default:
        //showUpdateAppPopup();
        break;
    }
  }
}
