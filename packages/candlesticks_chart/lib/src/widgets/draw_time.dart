import 'package:flutter/material.dart';

class DrawTime extends CustomPainter{
  String date;
  Offset offset;
  DrawTime({required String this.date, required Offset this.offset});
  @override
  void paint(Canvas canvas, Size size) {
    TextSpan span = TextSpan(style: new TextStyle(color: Colors.red[800], fontSize: 10), text: date);
    TextPainter tp = TextPainter(text: span, textAlign: TextAlign.center, textDirection: TextDirection.ltr);
    tp.layout(minWidth: 20);

    tp.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}