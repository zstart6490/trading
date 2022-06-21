import 'package:candlesticks/src/widgets/draw_dash_line.dart';
import 'package:flutter/material.dart';

class NewDashLine extends StatelessWidget {
  final Axis direction;
  final Color color;
  final double dashWidth;
  final double dashSpace;
  const NewDashLine({
    required this.direction,
    required this.color,
    required this.dashWidth,
    required this.dashSpace,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: direction == Axis.vertical ? 300 : 1,
      width: direction == Axis.vertical ? 1 : 300,
      child: CustomPaint(
        painter: DrawDashLine(
            direction: direction,
            color: color,
            dashWidth: dashWidth,
            dashSpace: dashSpace
        ),
      ),
    );
  }
}