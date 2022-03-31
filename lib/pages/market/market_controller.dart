import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/domain/use_cases/stock_use_case.dart';


class MarketController extends BaseController with StateMixin<List<StockModel>>  {

  final StockUseCase _stockUseCase = Get.find<StockUseCase>();

  List<StockModel> listStock = <StockModel>[];

  @override
  void onInit() {
    super.onInit();

  }

  @override
  void onReady() {
    getListStock();
    super.onReady();
  }


  void getListStock() async{
    showProgressingDialog();
    final result = await _stockUseCase.getList();
    hideDialog();

    if (result.data != null) {
      listStock = result.data!;
      change(listStock, status: RxStatus.success());
    } else if (result.error != null) {
      showSnackBar(result.error!.message);
    }
    update();
  }
}
