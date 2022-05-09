
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';

class StockLastPriceAnimated extends StatefulWidget{
  final num lastPrice;
  const StockLastPriceAnimated({
    required this.lastPrice,
  });

  @override
  _StockLastPriceAnimatedState createState() => _StockLastPriceAnimatedState();
}
class _StockLastPriceAnimatedState extends State<StockLastPriceAnimated>{
  _StockLastPriceAnimatedState();

  @override
  Widget build(BuildContext context) {
    return AnimatedFlipCounter(
      thousandSeparator: ".",
      decimalSeparator: ",",
      value:  widget.lastPrice/1000,
      fractionDigits: 2,
      textStyle: const TextStyle(
          fontSize: 12,
          fontFamily: "iCielHelveticaNowText-Medium",
          fontWeight: FontWeight.w500,
          color: Color(0xFF333333),
          overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
