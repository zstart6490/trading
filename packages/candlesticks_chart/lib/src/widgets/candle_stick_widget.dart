import 'dart:math';

import 'package:candlesticks/src/models/candle.dart';
import 'package:candlesticks/src/widgets/draw_time.dart';
import 'package:flutter/material.dart';
import '../models/candle.dart';

class CandleStickWidget extends LeafRenderObjectWidget {
  final List<Candle> candles;
  final int index;
  final double candleWidth;
  final double high;
  final double low;
  final Color bullColor;
  final Color bearColor;

  CandleStickWidget({
    required this.candles,
    required this.index,
    required this.candleWidth,
    required this.low,
    required this.high,
    required this.bearColor,
    required this.bullColor,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return CandleStickRenderObject(
      candles,
      index,
      candleWidth,
      low,
      high,
      bullColor,
      bearColor,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderObject renderObject) {
    CandleStickRenderObject candlestickRenderObject =
        renderObject as CandleStickRenderObject;
    candlestickRenderObject._close = candles[0].close;
    if (index <= 0 && candlestickRenderObject._close != candles[0].close) {
      candlestickRenderObject._candles = candles;
      candlestickRenderObject._index = index;
      candlestickRenderObject._candleWidth = candleWidth;
      candlestickRenderObject._high = high;
      candlestickRenderObject._low = low;
      candlestickRenderObject._bullColor = bullColor;
      candlestickRenderObject._bearColor = bearColor;
      candlestickRenderObject.markNeedsPaint();
    } else if (candlestickRenderObject._index != index ||
      candlestickRenderObject._candleWidth != candleWidth ||
      candlestickRenderObject._high != high ||
      candlestickRenderObject._low != low) {
      candlestickRenderObject._candles = candles;
      candlestickRenderObject._index = index;
      candlestickRenderObject._candleWidth = candleWidth;
      candlestickRenderObject._high = high;
      candlestickRenderObject._low = low;
      candlestickRenderObject._bullColor = bullColor;
      candlestickRenderObject._bearColor = bearColor;
      candlestickRenderObject.markNeedsPaint();
    }
    super.updateRenderObject(context, renderObject);
  }
}

class CandleStickRenderObject extends RenderBox {
  late List<Candle> _candles;
  late int _index;
  late double _candleWidth;
  late double _low;
  late double _high;
  late double _close;
  late Color _bullColor;
  late Color _bearColor;

  CandleStickRenderObject(
    List<Candle> candles,
    int index,
    double candleWidth,
    double low,
    double high,
    Color bullColor,
    Color bearColor,
  ) {
    _candles = candles;

    _index = index;
    _candleWidth = candleWidth;
    _low = low;
    _high = high;
    _bearColor = bearColor;
    _bullColor = bullColor;
  }

  /// set size as large as possible
  @override
  void performLayout() {
    size = Size(constraints.maxWidth, constraints.maxHeight);
  }

  /// draws a single candle
  void paintCandle(PaintingContext context, Offset offset, int index, Candle candle, double range, int indexData) {
    Color color = candle.isBull ? _bullColor : _bearColor;
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = min(2,(_candleWidth >6) ?  max(0.5, _candleWidth/8) : max(0.5, _candleWidth/4));

    Paint line = Paint()
      ..color = Color(0x59848E9C)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.7;

    double x = size.width + offset.dx - (index + 0.5) * _candleWidth;


    context.canvas.drawLine(
      Offset(x, offset.dy + (_high - candle.high) / range),
      Offset(x, offset.dy + (_high - candle.low) / range),
      paint,
    );

    //
    // /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // late double date_height = -10;
    // if(indexData >= 0) {
    //   final dateText = TextSpan(
    //     text: _candles[indexData].date.day.toString() + "/" +_candles[indexData].date.month.toString(),
    //     style:  TextStyle(
    //       color: Colors.black,
    //       fontSize: 12,
    //     ),
    //   );
    //   final dateTextPainter = TextPainter(
    //     text: dateText,
    //     textDirection: TextDirection.ltr,
    //   );
    //   dateTextPainter.layout(
    //     minWidth: 0,
    //     maxWidth: size.width,
    //   );
    //
    //   final montText = TextSpan(
    //     text: "Tháng " +_candles[indexData].date.month.toString(),
    //     style:  TextStyle(
    //       color: Colors.black,
    //       fontSize: 12,
    //     ),
    //   );
    //   final monthTextPainter = TextPainter(
    //     text: montText,
    //     textDirection: TextDirection.ltr,
    //   );
    //   monthTextPainter.layout(
    //     minWidth: 0,
    //     maxWidth: size.width,
    //   );
    //   final int current_month = _candles[0].date.month;
    //   if(_candleWidth <= 40 && _candleWidth > 30  && indexData % 2 ==0){
    //     context.canvas.drawLine(Offset(x, 0), Offset(x,size.height), line);
    //     dateTextPainter.paint(context.canvas, Offset(x - dateTextPainter.width/2 , date_height));
    //   }
    //   else if(_candleWidth <= 30 && _candleWidth >= 8  && indexData % 5 ==0){
    //     context.canvas.drawLine(Offset(x, 0), Offset(x,size.height), line);
    //     dateTextPainter.paint(context.canvas, Offset(x - dateTextPainter.width/2 , date_height));
    //   }
    //   else if(_candles[indexData].date.month != _candles[indexData +1].date.month) {
    //     if(_candleWidth < 8 && _candleWidth >= 4) {
    //       context.canvas.drawLine(Offset(x, 0), Offset(x, size.height), line);
    //       monthTextPainter.paint(
    //           context.canvas, Offset(x - monthTextPainter.width / 2, date_height));
    //     }
    //     else if(_candleWidth < 4 && _candleWidth > 1 && (_candles[indexData].date.month-current_month)%2 == 0){
    //       context.canvas.drawLine(Offset(x, 0), Offset(x,size.height), line);
    //       monthTextPainter.paint(context.canvas, Offset(x - monthTextPainter.width/2 , date_height));
    //     }
    //     else if(_candleWidth == 1 && (_candles[indexData].date.month-current_month)%3 == 0){
    //       context.canvas.drawLine(Offset(x, 0), Offset(x,size.height), line);
    //       monthTextPainter.paint(context.canvas, Offset(x - monthTextPainter.width/2 , date_height));
    //     }
    //   }
    // }

    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


    final double openCandleY = offset.dy + (_high - candle.open) / range;
    final double closeCandleY = offset.dy + (_high - candle.close) / range;

    if ((openCandleY - closeCandleY).abs() > 1) {
      context.canvas.drawLine(
        Offset(x, openCandleY),
        Offset(x, closeCandleY),
        paint..strokeWidth = (_candleWidth >6) ? _candleWidth/2 : _candleWidth*3/4,
      );
    } else {
      // if the candle body is too small
      final double mid = (closeCandleY + openCandleY) / 2;
      context.canvas.drawLine(
        Offset(x, mid - 0.5),
        Offset(x, mid + 0.5),
        paint..strokeWidth = (_candleWidth >6) ? _candleWidth/2 : _candleWidth*3/4,
      );
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    double range = (_high - _low) / size.height;
    for (int i = -1; (i + 1) * _candleWidth < size.width; i++) {
      final value = i +_index ;
      if (value >= _candles.length || value < 0) continue;
      var candle = _candles[value];
      paintCandle(context, offset, i, candle, range, value);
    }
    _close = _candles[0].close;
    context.canvas.save();
    context.canvas.restore();
  }
}
