import 'package:flutter/material.dart';
import 'package:trading_project/main.dart';

class TradingProject {
  static void startToTrading(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TradingApp(),
      ),
    );
  }
}
