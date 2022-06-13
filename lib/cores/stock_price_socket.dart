import 'dart:convert';

import 'package:get/get.dart';
import 'package:trading_module/configs/service_api_config.dart';
import 'package:trading_module/data/entities/socket_stock_event.dart';
import 'package:trading_module/data/entities/stock_price.dart';
import 'package:trading_module/pages/main_provider.dart';
import 'package:trading_module/sse/flutter_client_sse.dart';

class StockPriceSocket {
  Future subscribeStock(
      List<String> symbols, Function(SocketStockEvent) eventStock) async{
    final MainTradingProvider mainTradingProvider =
        Get.find<MainTradingProvider>();
    final stockSymbols = symbols.join('-');
    if (stockSymbols.isEmpty) return;
    unSubscribeStock();
    print("Link SubscribeStock: '${Environment().marketUrl}/stock/v1/subscribe/$stockSymbols'");
    SSEClient.subscribeToSSE(
        url: '${Environment().marketUrl}/stock/v1/subscribe/$stockSymbols',
        header: {
          "Authorization": mainTradingProvider.accessToken ?? "",
          "Cache-Control": "no-cache",
        }).listen(
      (event) {
        // print('Id: ' + event.id!);
        // print('Event: ' + event.event!);
        final stockEvent = SocketStockEvent(
            id: event.id ?? "",
            event: event.event ?? "",
            stockPrice: StockPrice.fromJson(jsonDecode(event.data ?? "")));
        print('symbol: ${stockEvent.stockPrice.symbol} - ${stockEvent.stockPrice.price}');
        // print('price: ${stockEvent.stockPrice.price}');
        eventStock.call(stockEvent);
      },
    );
  }

  void unSubscribeStock() {
    SSEClient.unsubscribeFromSSE();
  }
}
