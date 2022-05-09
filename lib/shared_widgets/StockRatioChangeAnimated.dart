
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';

class StockRatioChangeAnimated extends StatefulWidget{
  final num ratioChange;
  const StockRatioChangeAnimated({
    required this.ratioChange,
});

  @override
  _StockRatioChangeAnimatedState createState() => _StockRatioChangeAnimatedState();
}
class _StockRatioChangeAnimatedState extends State<StockRatioChangeAnimated>{
  _StockRatioChangeAnimatedState();

  @override
  Widget build(BuildContext context) {
    return AnimatedFlipCounter(
      thousandSeparator: ".",
      decimalSeparator: ",",
      value:  widget.ratioChange,
      fractionDigits: 2,
      prefix: (widget.ratioChange >0)? "+" : "",// decimal precision
      suffix: "%",
      textStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: (widget.ratioChange >0) ? const Color(0xFF33CC7F) : (widget.ratioChange <0 ? const Color(0xFFF46666) :const Color(0xFFFFBE40)),
        overflow: TextOverflow.ellipsis,
      ),

    );
  }
}
