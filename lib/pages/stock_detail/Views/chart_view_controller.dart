import 'dart:convert';
import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/domain/use_cases/stock_maket_usecase.dart';
import 'package:trading_module/utils/date_utils.dart';

class ChartController extends BaseController with StateMixin<List<Candle>>, GetSingleTickerProviderStateMixin {
  List<Candle> candles = [];
  Rx<bool> themeIsDark = false.obs;
  final StockModel stock;
  final StockMarketUseCase _stockMarketUseCase = Get.find<StockMarketUseCase>();

  final timeRange = ["1W".tr, "1M".tr, "3M".tr, "6M".tr, "1Y".tr];
  late TabController tabController;

  ChartController(this.stock);

  @override
  void onInit() {
    tabController = TabController(length: timeRange.length, vsync: this);
    tabController.addListener(() {
      if (!tabController.indexIsChanging) onTabChange(tabController.index);
    });
    super.onInit();
  }

  @override
  void onReady() {
    onTabChange(0);
    super.onReady();
    // fetchCandles().then((value) {
    //   candles = value;
    //   print("AAAAAA");
    //   print(value);
    //   change(candles, status: RxStatus.success());
    // });
  }

  void onTabChange(int index) {
    debugPrint("TabChange :${tabController.index}");
    final time = timeRange[index];
    getHistoryStockPrice(time);
  }

  Future<void> getHistoryStockPrice(String time) async {
    final result = await _stockMarketUseCase.getHistoryStockPrice(symbol: stock.symbol, type: time);
    if (result.data != null) {
      final length = result.data?.length ?? 0;
      final data = result.data!;
      candles.clear();
      for (var i = 0; i < length; i++){
        final candle = Candle(date: DateFormat(DateFormater.ddMMYYYY).parse(data[i].tradingDate ?? ""), high: data[i].high, low: data[i].low, open: data[i].open, close: data[i].close, volume: data[i].volume);
        candles.add(candle);
      }

      for (var i = 0; i < length; i++) {
        print(candles[i].date.toString());
      }

      change(candles, status: RxStatus.success());
    } else if (result.error != null) {
      change(null, status: RxStatus.error());
      showSnackBar(result.error!.message);
    }
  }

  void changeThem(){
    themeIsDark.value = !themeIsDark.value;
  }

  Future<List<Candle>> fetchCandles() async {
    final uri = Uri.parse(
        "https://api.binance.com/api/v3/klines?symbol=BTCUSDT&interval=1h");
    final res = await http.get(uri);

    return (jsonDecode(res.body) as List<dynamic>)
        .map((e) => Candle.fromJson(e as List<dynamic>))
        .toList()
        .reversed
        .toList();
  }
}
