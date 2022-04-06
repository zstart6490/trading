import 'package:get/get.dart';
import 'package:trading_module/cores/socket_stock.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/domain/use_cases/stock_exchange_usecase.dart';

class ExchangeStockController extends BaseController {
  StockExchangeUseCase stockExchangeUseCase = Get.find<StockExchangeUseCase>();
  StockPriceSocket stockPriceSocket = Get.find();
  final String symbol;
  final String symbolDesc;
   double price;
  RxDouble priceStock = 0.0.obs;

  ExchangeStockController(this.symbol,this.symbolDesc, this.price);

  @override
  void onInit() {
    priceStock.value = price;
    stockPriceSocket.subscribeStock(
      [symbol],
      (event) {
        // print('symbol: ${event.stockPrice.symbol} - ${event.stockPrice.price}');
        if (symbol == event.stockPrice.symbol) {
          priceStock.value = event.stockPrice.price ?? 0;
          price=priceStock.value;
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
