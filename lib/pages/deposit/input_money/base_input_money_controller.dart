
import 'package:tikop/modules/deposit/interest_tool/base_interest_controller.dart';
import 'package:tikop/repository/common_repository.dart';
import 'package:tikop/models/SavingProduct.dart';

class BaseInputMoneyController extends BaseInterstController {
  int inputAmount = 0;

  bool showMoneySuggess = false;
  final commonRepository = CommonRepository();

  final SavingProduct product;
  BaseInputMoneyController(this.product);

  @override
  void onInit() {
    selectedProduct = product;
    maxAmount = product.maxMoneyUser - product.totalUsed;
    super.onInit();
  }
}
