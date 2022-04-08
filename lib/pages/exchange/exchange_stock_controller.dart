import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/cores/stock_price_socket.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/domain/use_cases/stock_exchange_usecase.dart';

class ExchangeStockController extends BaseController {
  StockExchangeUseCase stockExchangeUseCase = Get.find<StockExchangeUseCase>();
  StockPriceSocket stockPriceSocket = Get.find();
  StockModel stockModel;
  RxDouble priceStock = 0.0.obs;

  ExchangeStockController(this.stockModel);

  @override
  void onInit() {
    priceStock.value = stockModel.lastPrice;
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
