import 'dart:ffi';

import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';

class StockChangeAnimated extends StatefulWidget{
  final num lastValue;
  final num currentValue;
  const StockChangeAnimated({
    required this.lastValue,
    required this.currentValue
});

  @override
  _StockChangeAnimatedState createState() => _StockChangeAnimatedState();
}
class _StockChangeAnimatedState extends State<StockChangeAnimated>{
  _StockChangeAnimatedState();

  @override
  Widget build(BuildContext context) {
    return AnimatedFlipCounter(

      value:  widget.currentValue - widget.lastValue,
      fractionDigits: 2,
      prefix: (widget.currentValue - widget.lastValue >0)? "+" : "",// decimal precision
      suffix: "%",
      textStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: (widget.currentValue - widget.lastValue >0)? Colors.green : Colors.red,
      ),
    );
  }


}