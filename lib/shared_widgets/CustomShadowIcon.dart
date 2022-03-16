import 'package:flutter/material.dart';
import 'package:trading_module/utils/util.dart';

class CustomShadowWidget extends StatelessWidget {
  final Widget child;
  final Color? shadowColor;
  final Color? backgrondColor;
  final BoxShape shape;
  final double? width;
  final double? height;
  final Offset offset;
  final double blurRadius;
  final double spreadRadius;
  const CustomShadowWidget({
    Key? key,
    required this.child,
    this.shadowColor,
    this.shape = BoxShape.circle,
    this.backgrondColor,
    this.width,
    this.height,
    this.offset = Offset.zero,
    this.blurRadius = 10.0,
    this.spreadRadius = 3.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgrondColor ?? context.backgroundColor,
        shape: shape,
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? context.shadowColor.withOpacity(0.1),
            blurRadius: blurRadius,
            spreadRadius: spreadRadius,
            offset: offset,
          )
        ],
      ),
      child: Center(child: child),
    );
  }
}
