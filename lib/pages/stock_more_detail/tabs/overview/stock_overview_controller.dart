import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/data/repos/stock_repo_impl.dart';
import 'package:trading_module/data/services/local/stock_storage_service.dart';
import 'package:trading_module/data/services/stock_service.dart';
import 'package:trading_module/domain/entities/stock_current_price_model.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/domain/use_cases/stock_usecase.dart';
import 'package:trading_module/pages/stock_more_detail/stock_more_detail_controller.dart';

class StockOverviewController extends BaseController
    with StateMixin<StockCurrentPriceModel>, GetSingleTickerProviderStateMixin {
  final StockModel stock;

  StockOverviewController(this.stock);

  final StockUseCase _stockUseCase = StockUseCase(StockRepoImpl(StockServiceImpl(),StockStorageServiceImpl()));

  StockCurrentPriceModel? _stockCurrentPriceModel;

  @override
  void onReady() {
    getCurrentStockPrice();
    super.onReady();

    // double ab = 123.56;
    // final a = ab.toPrecision(0).getPriceStock();
    // print("AAAAAARRR: $a");
  }

  Future<void> getCurrentStockPrice() async {
    if (_stockCurrentPriceModel == null) {
      change(null, status: RxStatus.loading());
      final result =
          await _stockUseCase.getCurrentStockPrice(symbol: stock.symbol);
      if (result.data != null) {
        final StockMoreDetailController _homePageController =
            Get.find<StockMoreDetailController>();
        _homePageController.isFollow.value =
            result.data?.isProductWatching ?? false;
        _homePageController.isValid.value = result.data?.isAllowSell ?? false;
        _stockCurrentPriceModel = result.data;
        change(result.data, status: RxStatus.success());
      } else if (result.error != null) {
        change(null, status: RxStatus.error(result.error!.message));
        showSnackBar(result.error!.message);
      }
    }
  }
}
