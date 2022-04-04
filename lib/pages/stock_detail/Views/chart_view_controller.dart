import 'dart:convert';
import 'package:candlesticks/candlesticks.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:trading_module/cores/states/base_controller.dart';

class ChartController extends BaseController with StateMixin<List<Candle>> {
  List<Candle> candles = [];
  Rx<bool> themeIsDark = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    print("FFFFFFF");
    fetchCandles().then((value) {
      print(value);
      candles = value;
      change(candles, status: RxStatus.success());
    });
  }

  void changeThem(){
    themeIsDark.value = !themeIsDark.value;
  }

  Future<List<Candle>> fetchCandles() async {
    final uri = Uri.parse(
        "https://api.binance.com/api/v3/klines?symbol=BTCUSDT&interval=1h");
    final res = await http.get(uri);
    print("AAAAAA");
    print(res.body);
    return (jsonDecode(res.body) as List<dynamic>)
        .map((e) => Candle.fromJson(e as List<dynamic>))
        .toList()
        .reversed
        .toList();
  }
}
