import 'dart:convert';

import 'package:flutter_client_sse/flutter_client_sse.dart';
import 'package:get/get.dart';
import 'package:trading_module/data/entities/socket_stock_event.dart';
import 'package:trading_module/data/entities/stock_price.dart';
import 'package:trading_module/pages/main_provider.dart';

class StockPriceSocket {
  void subscribeStock(
      List<String> symbols, Function(SocketStockEvent) eventStock) {
    final MainTradingProvider mainTradingProvider =
        Get.find<MainTradingProvider>();
    final buffer = StringBuffer();
    for (final value in symbols) {
      buffer.write('$value-');
    }

    if (buffer.isEmpty) return;
    final String symbolsListen =
        buffer.toString().removeAllWhitespace.substring(0, buffer.length - 1);
    // print("SubscribeStock: $symbolsListen");
    SSEClient.subscribeToSSE(
        url: 'http://104.199.179.48:8910/stock/v1/subscribe/$symbolsListen',
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
            stockPrice: StockPrice.fromJson(jsonDecode(event.data??"")));
        // print('symbol: ${stockEvent.stockPrice.symbol}');
        // print('price: ${stockEvent.stockPrice.price}');
        eventStock.call(stockEvent);
      },
    );
  }

  void unSubscribeStock() {
    SSEClient.unsubscribeFromSSE();
  }
}
