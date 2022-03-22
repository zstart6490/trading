import 'package:flutter/material.dart';

class CircularIcon extends StatelessWidget {
  const CircularIcon({
    Key? key,
    required this.color,
    required this.radius,
    required this.child,
  }) : super(key: key);
  final Color color;
  final double radius;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        width: radius,
        height: radius,
        child: Center(child: child));
  }
}
