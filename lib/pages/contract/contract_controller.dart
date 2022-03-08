import 'package:trading_module/data/services/user_service.dart';
import 'package:trading_module/domain/use_cases/user_use_case.dart';
import '../../cores/states/base_controller.dart';
import 'package:get/get.dart';

class ContractController extends BaseController {
  RxString urlPdf = "".obs;
  final UserUseCase _userUseCase = Get.find();


  @override
  void onInit() {
    getContractUser();
    super.onInit();
  }


  void getContractUser() async {
    var linkPdf = await _userUseCase.getContractUser("");
    print("NTM");
    if (linkPdf != null) {
      print(urlPdf.value );
    }
  }
}
