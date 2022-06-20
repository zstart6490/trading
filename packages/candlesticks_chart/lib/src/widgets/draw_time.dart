import 'package:flutter/material.dart';

class DrawTime extends CustomPainter{
  String date;
  DrawTime({required String this.date});
  @override
  void paint(Canvas canvas, Size size) {
    TextSpan span = TextSpan(style: new TextStyle(color: Colors.red[800], fontSize: 10), text: date);
    TextPainter tp = TextPainter(text: span, textAlign: TextAlign.center, textDirection: TextDirection.ltr);
    tp.layout(minWidth: 20);

    tp.paint(canvas, Offset( tp.width /2 * -1,0));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}