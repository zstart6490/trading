import 'package:flutter/material.dart';
import 'package:trading_module/utils/util.dart';

class CustomShadow extends StatelessWidget {
  final BoxShape? shape;
  final Color? color;
  final Color? shadowColor;
  final BorderRadius? borderRadius;
  final double? elevation;
  final Widget child;

  const CustomShadow({
    Key? key,
    this.shape,
    this.color,
    this.shadowColor,
    this.borderRadius,
    this.elevation,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: color ?? Colors.white,
      shadowColor: shadowColor ?? context.shadowColor.withOpacity(0.5),
      borderRadius: borderRadius ?? BOR_RAD8,
      elevation: elevation ?? 2.0,
      shape: shape ?? BoxShape.rectangle,
      child: child,
    );
  }
}
