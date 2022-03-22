
//import 'package:tikop/repository/common_repository.dart';
import 'package:trading_module/data/entities/naptien/SavingProduct.dart';
import 'package:trading_module/pages/deposit/interest_tool/base_interest_controller.dart';

class TDBaseInputMoneyController extends TDBaseInterstController {
  int inputAmount = 0;

  bool showMoneySuggess = false;
  //final commonRepository = CommonRepository();

  final SavingProduct product;
  TDBaseInputMoneyController(this.product);

  @override
  void onInit() {
    selectedProduct = product;
    maxAmount = product.maxMoneyUser - product.totalUsed;
    super.onInit();
  }
}
