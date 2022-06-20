
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/utils/extensions.dart';

class StockRatioChangeAnimated extends StatefulWidget{
  final StockModel stock;
  const StockRatioChangeAnimated({
    required this.stock,
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
      value:  widget.stock.ratioChange,
      fractionDigits: (widget.stock.ratioChange < 100)? 2 : 0,
      prefix: (widget.stock.ratioChange >0)? "+" : "",// decimal precision
      suffix: "%",
      textStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: -1,
        color: widget.stock.lastPrice.getStockColorWith(widget.stock.refPrice, widget.stock.floor, widget.stock.ceiling),
          // (widget.ratioChange >0) ? const Color(0xFF33CC7F) : (widget.ratioChange <0 ? const Color(0xFFF46666) :const Color(0xFFFFBE40)),
        overflow: TextOverflow.ellipsis,
        height: 20/14
      ),

    );
  }
}
