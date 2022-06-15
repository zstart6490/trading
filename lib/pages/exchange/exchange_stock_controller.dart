import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/cores/stock_price_socket.dart';
import 'package:trading_module/data/repos/stock_repo_impl.dart';
import 'package:trading_module/data/services/local/stock_storage_service.dart';
import 'package:trading_module/data/services/stock_service.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/domain/use_cases/stock_exchange_usecase.dart';
import 'package:trading_module/domain/use_cases/stock_usecase.dart';
import 'package:trading_module/shared_widgets/CustomAlertDialog.dart';

class ExchangeStockController extends BaseController {
  StockExchangeUseCase stockExchangeUseCase = Get.find<StockExchangeUseCase>();
  final StockUseCase _stockUseCase = StockUseCase(
      StockRepoImpl(StockServiceImpl(), StockStorageServiceImpl()));
  StockPriceSocket stockPriceSocket = Get.find();
  StockModel stockModel;
  RxDouble priceStock = 0.0.obs;
  RxString symbolStock = "".obs;
  RxString imageStock = "".obs;
  RxString nameStock = "".obs;
  RxBool isLoadingStockDetail = false.obs;

  ExchangeStockController(this.stockModel);

  @override
  void onInit() {
    symbolStock.value = stockModel.symbol;
    priceStock.value = stockModel.lastPrice;
    imageStock.value = stockModel.fullLink;
    nameStock.value = stockModel.stockName;
    stockPriceSocket.subscribeStock(
      [stockModel.symbol],
      (event) {
        // print('symbol: ${event.stockPrice.symbol} - ${event.stockPrice.price}');
        if (stockModel.symbol == event.stockPrice.symbol) {
          priceStock.value = event.stockPrice.price ?? 0;
        }
      },
    );
    super.onInit();
  }

  Future<bool> getStockDetail() async {
    isLoadingStockDetail.value = true;
    final result =
        await _stockUseCase.getCurrentStockPrice(symbol: stockModel.symbol);
    if (result.data != null) {
      symbolStock.value = result.data?.symbol ?? "";
      priceStock.value = result.data?.lastPrice ?? 0;
      imageStock.value = result.data?.fullLink ?? "";
      nameStock.value = result.data?.stockName ?? "";
      isLoadingStockDetail.value = false;
      return true;
    } else if (result.error != null) {
      showDialogTry(result.error!.message);
    }
    return false;
  }

  void showDialogTry(String msgErr) {
    showAlertDialog(CustomAlertDialog(
        title: "Không lấy được thông tin cổ phiếu!",
        desc:
            "Vui lòng kiểm tra lại internet hoặc thử lại.Thông tin lỗi( $msgErr )",
        actions: [
          AlertAction(
              text: "cancel".tr,
              onPressed: () {
                hideDialog();
                Get.back();
              }),
          AlertAction(
              text: "try_again".tr,
              onPressed: () {
                getStockDetail();
              }),
        ]));
  }

  @override
  void onReady() {
    // getStockDetail();

    super.onReady();
  }

  @override
  void onClose() {
    stockPriceSocket.unSubscribeStock();
    super.onClose();
  }

  @override
  Future<bool> onWillPop() {
    stockPriceSocket.unSubscribeStock();
    return super.onWillPop();
  }
}
