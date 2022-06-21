import 'dart:math';

import 'package:candlesticks/src/models/candle.dart';
import 'package:candlesticks/src/widgets/draw_time.dart';
import 'package:flutter/material.dart';
import '../models/candle.dart';

class DrawTime extends LeafRenderObjectWidget {
  final List<Candle> candles;
  final int index;
  final double candleWidth;

  DrawTime({
    required this.candles,
    required this.index,
    required this.candleWidth,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return CandleStickRenderObject(
      candles,
      index,
      candleWidth,
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
      candlestickRenderObject.markNeedsPaint();
    } else if (candlestickRenderObject._index != index ||
        candlestickRenderObject._candleWidth != candleWidth ) {
      candlestickRenderObject._candles = candles;
      candlestickRenderObject._index = index;
      candlestickRenderObject._candleWidth = candleWidth;
      candlestickRenderObject.markNeedsPaint();
    }
    super.updateRenderObject(context, renderObject);
  }
}

class CandleStickRenderObject extends RenderBox {
  late List<Candle> _candles;
  late int _index;
  late double _candleWidth;
  late double _close;
  final double bottomHeight = 30;
  CandleStickRenderObject(
      List<Candle> candles,
      int index,
      double candleWidth,
      ) {
    _candles = candles;

    _index = index;
    _candleWidth = candleWidth;
  }

  /// set size as large as possible
  @override
  void performLayout() {
    size = Size(constraints.maxWidth, constraints.maxHeight);
  }

  /// draws a single candle
  void paintCandle(PaintingContext context, Offset offset, int index, Candle candle, int indexData) {

    Paint line = Paint()
      ..color = Color(0x59848E9C)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.7;

    double x = size.width + offset.dx - (index + 0.5) * _candleWidth;

    late double date_height = size.height - 20;
    if(indexData >= 0) {

      final dateText = TextSpan(
        text: _candles[indexData].date.day.toString() + "/" +_candles[indexData].date.month.toString(),
        style:  TextStyle(
          color: Colors.black,
          fontSize: 12,
        ),
      );
      final dateTextPainter = TextPainter(
        text: dateText,
        textDirection: TextDirection.ltr,
      );
      dateTextPainter.layout(
        minWidth: 0,
        maxWidth: size.width,
      );

      final montText = TextSpan(
        text: "Tháng " +_candles[indexData].date.month.toString(),
        style:  TextStyle(
          color: Colors.black,
          fontSize: 12,
        ),
      );
      final monthTextPainter = TextPainter(
        text: montText,
        textDirection: TextDirection.ltr,
      );
      monthTextPainter.layout(
        minWidth: 0,
        maxWidth: size.width,
      );

      var endLine = size.height - bottomHeight ;
      final int current_month = _candles[0].date.month;

      if(indexData < _candles.length - 1){
        if(_candleWidth <= 40 && _candleWidth > 30  && indexData % 2 ==0){
          context.canvas.drawLine(Offset(x, 0), Offset(x,endLine), line);
          dateTextPainter.paint(context.canvas, Offset(x - dateTextPainter.width/2 , date_height));
        }
        else if(_candleWidth <= 30 && _candleWidth >= 8  && indexData % 5 ==0){
          context.canvas.drawLine(Offset(x, 0), Offset(x,endLine), line);
          dateTextPainter.paint(context.canvas, Offset(x - dateTextPainter.width/2 , date_height));
        }
        else if(_candles[indexData].date.month != _candles[indexData +1].date.month) {
          if(_candleWidth < 8 && _candleWidth >= 4) {
            context.canvas.drawLine(Offset(x, 0), Offset(x, endLine), line);
            monthTextPainter.paint(
                context.canvas, Offset(x - monthTextPainter.width / 2, date_height));
          }
          else if(_candleWidth < 4 && _candleWidth > 1 && (_candles[indexData].date.month-current_month)%2 == 0){
            context.canvas.drawLine(Offset(x, 0), Offset(x,endLine), line);
            monthTextPainter.paint(context.canvas, Offset(x - monthTextPainter.width/2 , date_height));
          }
          else if(_candleWidth == 1 && (_candles[indexData].date.month-current_month)%3 == 0){
            context.canvas.drawLine(Offset(x, 0), Offset(x,endLine), line);
            monthTextPainter.paint(context.canvas, Offset(x - monthTextPainter.width/2 , date_height));
          }
        }
      }
    }

  }

  @override
  void paint(PaintingContext context, Offset offset) {


    context.canvas.drawRect(Rect.fromLTWH(0, size.height - bottomHeight,  size.width , bottomHeight), Paint()..color = Colors.white);

    for (int i = -10; (i + 1) * _candleWidth < size.width; i++) {
      final value = i +_index ;
      if (value >= _candles.length || value < 0) continue;
      var candle = _candles[value];
      paintCandle(context, offset, i, candle, value);
    }
    _close = _candles[0].close;
    context.canvas.save();
    context.canvas.restore();
  }
}
