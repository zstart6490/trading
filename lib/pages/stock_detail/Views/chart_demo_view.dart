import 'dart:convert';
import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChartDemoView extends StatefulWidget {

  const ChartDemoView({
    Key? key,
  }) : super(key: key);

  @override
  _ChartDemoViewState createState() => _ChartDemoViewState();
}

class _ChartDemoViewState extends State<ChartDemoView> {
  List<Candle> candles = [];
  bool themeIsDark = false;

  @override
  void initState() {
    print("chart initttttttttt");
    fetchCandles().then((value) {
      setState(() {
        candles = value;
        print("chart initttttttttt1111");
      });
    });
    super.initState();
  }

  Future<List<Candle>> fetchCandles() async {
    final uri = Uri.parse(
        "https://api.binance.com/api/v3/klines?symbol=BTCUSDT&interval=1h");
    final res = await http.get(uri);
    return (jsonDecode(res.body) as List<dynamic>)
        .map((e) => Candle.fromJson(e))
        .toList()
        .reversed
        .toList();
  }

  @override
  void dispose() {
    super.dispose();
  }

// change textStyle color
  @override
  Widget build(BuildContext context) {
    return Candlesticks(
      candles: candles,
    );
  }
}
