import 'package:flutter/material.dart';

class RevertBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0);
    path.arcToPoint(
      Offset(0, size.height),
      rotation: 180,
      radius: const Radius.circular(1),
    );

    path.lineTo(size.width, size.height);
    path.arcToPoint(
      Offset(size.width, 0),
      rotation: 180,
      radius: const Radius.circular(1),
    );
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
