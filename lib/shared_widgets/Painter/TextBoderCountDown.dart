import 'dart:math';
import 'package:flutter/material.dart';

class TextBorderCountDown extends StatefulWidget {
  const TextBorderCountDown({
    Key? key,
    required this.time,
    this.color = const Color(0xFF33CC7F),
    this.bgColor = const Color(0xFFF5F6FA),
    this.child,
  }) : super(key: key);
  final int time;
  final Color bgColor, color;
  final Widget? child;
  @override
  _TextBorderCountDownState createState() => _TextBorderCountDownState();
}

class _TextBorderCountDownState extends State<TextBorderCountDown>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _countDownAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.time),
    );
    _countDownAnimation =
        Tween<double>(begin: 0, end: 100).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Stack(
        children: [
          SizedBox(
            height: 60,
            width: double.infinity,
            child: CustomPaint(
              painter: TextBoderCountDownPainter(
                  animation: _countDownAnimation,
                  color: widget.color,
                  bgColor: widget.bgColor),
            ),
          ),
          if (widget.child != null) Center(child: widget.child)
        ],
      ),
    );
  }

  @override
  void didUpdateWidget(covariant TextBorderCountDown oldWidget) {
    if (oldWidget.child != widget.child) {
      _controller.forward(from: 0);
    }
    super.didUpdateWidget(oldWidget);
  }
}

class TextBoderCountDownPainter extends CustomPainter {
  TextBoderCountDownPainter({
    required this.animation,
    required this.bgColor,
    required this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color bgColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = 1.0
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;
    final line1lenght = size.width - 16.0;
    final line2lenght = size.height - 16.0;

    final s1percent = (animation.value / 42).clamp(0, 1);
    final s2percent = (animation.value - 42).clamp(0, 1);
    final s3percent = ((animation.value - 42) / 6).clamp(0, 1);
    final s4percent = ((animation.value - 48) / 1).clamp(0, 1);
    final s5percent = ((animation.value - 49) / 42).clamp(0, 1);
    final s6percent = ((animation.value - 91) / 1).clamp(0, 1);
    final s7percent = ((animation.value - 92) / 6).clamp(0, 1);
    final s8percent = ((animation.value - 98) / 1).clamp(0, 1);

    final start = Offset(8 + s1percent * line1lenght, 0);
    final p2 = Offset(8 + line1lenght, 0);
    canvas.drawLine(start, p2, paint);
    // if (s1percent == 0) {

    canvas.drawArc(
        Rect.fromCircle(
          center: Offset(size.width - 8.0, 8.0),
          radius: 8,
        ),
        radians(0),
        radians(-90.0 + 90.0 * s2percent),
        false,
        paint);

    canvas.drawLine(Offset(size.width, 8.0 + s3percent * line2lenght),
        Offset(size.width, 8.0 + line2lenght), paint);

    canvas.drawArc(
        Rect.fromCircle(
          center: Offset(size.width - 8.0, size.height - 8.0),
          radius: 8,
        ),
        radians(90.0),
        radians(-90.0 + 90.0 * s4percent),
        false,
        paint);

    canvas.drawLine(
        Offset(size.width - 8.0 - s5percent * line1lenght, size.height),
        Offset(size.width - 8 - line1lenght, size.height),
        paint);

    canvas.drawArc(
        Rect.fromCircle(
          center: Offset(8.0, size.height - 8.0),
          radius: 8,
        ),
        radians(180.0),
        radians(-90.0 + 90 * s6percent),
        false,
        paint);
    canvas.drawLine(Offset(0, size.height - 8.0 - s7percent * line2lenght),
        Offset(0, size.height - 8 - line2lenght), paint);
    canvas.drawArc(
        Rect.fromCircle(
          center: const Offset(8.0, 8.0),
          radius: 8,
        ),
        radians(270),
        radians(-90.0 + 90 * s8percent),
        false,
        paint);

    paint
      ..color = bgColor
      ..style = PaintingStyle.fill;
    final rrect = RRect.fromRectAndRadius(
        Rect.fromLTWH(.5, 0.5, size.width - 1, size.height - 1),
        const Radius.circular(8));

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(TextBoderCountDownPainter old) {
    return animation.value != old.animation.value || color != old.color;
  }

  final double _degrees2Radians = pi / 180.0;
  double radians(double degrees) => degrees * _degrees2Radians;
  final double _radians2Degrees = 180.0 / pi;
  double degrees(double radians) => radians * _radians2Degrees;
}
