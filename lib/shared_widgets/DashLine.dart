import 'package:flutter/material.dart';

class DashLine extends StatelessWidget {
  final double dashHeight;
  final Color color;
  final double dashWidth;

  const DashLine(
      {this.dashHeight = 0.5,
      this.dashWidth = 5.0,
      this.color = Colors.black26});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}
