import 'package:flutter/material.dart';

class Dot extends StatelessWidget {
  final Color color;
  final bool isShow;
  final double size;
  const Dot(
      {Key? key, this.color = Colors.red, this.isShow = true, this.size = 8.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: isShow ? color : Colors.transparent),
    );
  }
}
