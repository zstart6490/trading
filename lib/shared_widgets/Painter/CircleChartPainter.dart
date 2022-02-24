import 'dart:math' as math;

import 'package:flutter/material.dart';

enum ShowInfoStyle {
  allways,
  onTouch,
  never,
}

class PieDataTween extends Tween<PieData> {
  PieDataTween({required PieData begin, required PieData end})
      : super(begin: begin, end: end);
  @override
  PieData lerp(double t) {
    return begin!.copyWith(
      percent: _lerp(begin!.percent, end!.percent, t),
      color: Color.lerp(begin!.color, end!.color, t),
      incrDegree: _lerp(begin!.incrDegree, end!.incrDegree, t),
      incrWidth: _lerp(begin!.incrWidth, end!.incrWidth, t),
      title: end!.title,
      selected: end!.selected,
    );
  }

  double _lerp(double begin, double end, double t) => begin + (end - begin) * t;
}

class PieData {
  final String title;
  final double percent;
  double lineWidth;
  double incrDegree;
  double incrWidth;
  Color color;
  double startDegree;
  double degree;

  bool selected;

  PieData({
    this.title = "",
    this.percent = 0.0,
    this.color = Colors.white,
    this.lineWidth = 25,
    this.incrDegree = 0,
    this.incrWidth = 0,
    this.selected = false,
    this.startDegree = 0.0,
    this.degree = 0.0,
  });

  factory PieData.zero() {
    return PieData();
  }

  bool isEqual(PieData b) {
    return percent == b.percent &&
        title == b.title &&
        lineWidth == b.lineWidth &&
        incrDegree == b.incrDegree &&
        color == b.color &&
        selected == b.selected;
  }

  PieData copyWith({
    String? title,
    double? percent,
    double? lineWidth,
    double? incrDegree,
    double? incrWidth,
    Color? color,
    double? startDegree,
    double? degree,
    bool? selected,
  }) {
    return PieData(
      title: title ?? this.title,
      percent: percent ?? this.percent,
      lineWidth: lineWidth ?? this.lineWidth,
      incrDegree: incrDegree ?? this.incrDegree,
      incrWidth: incrWidth ?? this.incrWidth,
      color: color ?? this.color,
      startDegree: startDegree ?? this.startDegree,
      degree: degree ?? this.degree,
      selected: selected ?? this.selected,
    );
  }
}

class CircleChartPainter extends CustomPainter with TouchHandler {
  final Paint _paintLine = Paint();
  final List<PieData> data;
  final double radius;
  final int selectedIndex;
  final TextStyle pieTextStyle;
  final double lineWidth;
  final Color bgColor;
  final ShowInfoStyle showInfoStyle;
  late Offset center;

  CircleChartPainter(
    Function(TouchHandler) touchHandler, {
    required this.lineWidth,
    required this.bgColor,
    this.selectedIndex = -1,
    required this.data,
    required this.radius,
    required this.pieTextStyle,
    required this.showInfoStyle,
  }) {
    touchHandler(this);
  }

  @override
  void paint(Canvas canvas, Size size) {
    const lineColor = Color(0xFF858585);
    center = Offset(size.width / 2, size.height / 2);
    _paintLine.style = PaintingStyle.stroke;
    //Draw background
    _paintLine.strokeWidth = lineWidth;
    _paintLine.color = bgColor;
    canvas.drawArc(
        Rect.fromCircle(
          center: center,
          radius: radius - lineWidth / 2,
        ),
        0,
        2 * math.pi,
        false,
        _paintLine);

    //Sắp xếp
    final listData = List<PieData>.from(_calulateData());
    listData.sort((a, b) => a.incrWidth.compareTo(b.incrWidth));
    for (final d in listData) {
      final opacity = math.min(d.incrDegree / 2, 1.0);

      ///draw shadow
      if (d.incrWidth > 0.0) {
        _paintLine.color = Colors.grey.withOpacity(opacity / 10.0);
        _paintLine.strokeWidth = d.lineWidth + d.incrWidth;
        canvas.drawArc(
            Rect.fromCircle(
              center: center,
              radius: radius - d.lineWidth / 2 - d.incrWidth / 2,
            ),
            radians(d.startDegree - d.incrDegree * 1.2),
            radians(d.degree + d.incrDegree * 2.5 * 2),
            false,
            _paintLine);
      }
      _paintLine.color = d.color;
      _paintLine.strokeWidth = d.lineWidth + d.incrWidth;

      ///Draw normal pie
      canvas.drawArc(
          Rect.fromCircle(
            center: center,
            radius: radius - (d.lineWidth + d.incrWidth) / 2 + d.incrWidth,
          ),
          radians(d.startDegree - d.incrDegree),
          radians(d.degree + d.incrDegree * 2),
          false,
          _paintLine);

      final lineAngle = 90 - (d.startDegree + d.degree / 2.0);
      if (showInfoStyle == ShowInfoStyle.allways) {
        _drawInfo(lineAngle, d, canvas, 1, lineColor, size);
      }

      //Draw Selected and Unselected
      if (showInfoStyle == ShowInfoStyle.onTouch && d.incrWidth > 0.0) {
        _drawInfo(lineAngle, d, canvas, opacity, lineColor, size);
      }
    }
  }

  void _drawInfo(double lineAngle, PieData data, Canvas canvas, double opacity,
      Color lineColor, Size size) {
    if (data.percent > 0) {
      _paintLine.color = lineColor.withOpacity(opacity);
      _paintLine.strokeWidth = 1;
      final bool isRightSide = lineAngle >= 0;
      final double p2length = 20 + (5 * math.cos(radians(lineAngle))).abs();
      final double p3length =
          sigl(lineAngle) * 10 * math.cos(radians(lineAngle)).abs();
      final p1 = center +
          getOffset(lineAngle, radius - data.lineWidth / 2 + data.incrWidth);
      final p2 = center +
          getOffset(lineAngle,
              radius - data.lineWidth / 2 + data.incrWidth + p2length);

      final p3 = Offset(p2.dx + p3length, p2.dy);
      canvas.drawLine(p1, p2, _paintLine);
      canvas.drawLine(p3, p2, _paintLine);

      ///cal text max width
      final maxWidth =
          isRightSide ? (size.width - p3.dx - 16.0) : (p3.dx - 16.0);

      ///create text Painter
      final String fitStr =
          _getFitString(data.title, data.percent * 100, maxWidth);
      final span = TextSpan(
        text: fitStr,
        style: pieTextStyle.copyWith(color: lineColor.withOpacity(opacity)),
      );
      final tp = TextPainter(
        text: span,
        maxLines: 1,
        textDirection: TextDirection.ltr,
      );
      tp.layout();

      ///draw dot

      var dotDx = p3.dx + (isRightSide ? 6 : -(tp.size.width + 6));
      if (dotDx < 4) dotDx = 4;
      final p4 = Offset(dotDx, p3.dy);
      _paintLine.color = data.color.withOpacity(opacity);
      _paintLine.strokeWidth = 3;
      canvas.drawCircle(p4, 2, _paintLine);
      // canvas.drawCircle(p3, 5, _paintLine);
      final dx = p4.dx + 6;
      final p5 = Offset(dx, p4.dy - 8);

      tp.paint(canvas, p5);

      // var p6 = Offset(p5.dx, p4.dy + 2);

      _paintLine.color = Colors.red;
      _paintLine.strokeWidth = 1;
      // canvas.drawLine(p6, Offset(p6.dx + maxWidth, p6.dy), _paintLine);
    }
  }

  List<PieData> _calulateData() {
    var startAngle = 0.0;
    for (int i = 0; i < data.length; i++) {
      final p = data[i];
      final degree = p.percent * 360;
      p.startDegree = startAngle - 90;
      p.degree = degree;
      startAngle += degree;
    }
    return data;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  @override
  int handleTouch(Offset touchInput) {
    final touchedPoint2 = touchInput - center;

    final touchX = touchedPoint2.dx;
    final touchY = touchedPoint2.dy;

    final touchR = math.sqrt(math.pow(touchX, 2) + math.pow(touchY, 2));
    final touchDegree = degrees(math.atan2(touchY, touchX));
    final list = _calulateData();

    for (int i = 0; i < list.length; i++) {
      final data = list[i];
      if (validDegree(touchDegree, data) &&
          validRadius(touchR, data.lineWidth)) {
        return i;
      }
    }

    return -1;
  }

  bool validRadius(double r, double lineWidth) {
    final min = radius - lineWidth;
    final max = radius;
    return r > min && r < max;
  }

  bool validDegree(double d, PieData data) {
    // print("d:$d - s:${data.startDegree} e:${data.startDegree + data.degree}");
    if (d < -90) {
      // ignore: parameter_assignments
      d = 360 + d;
      // print("invesrt degree $d");
    }
    final valid =
        d >= data.startDegree && d <= (data.startDegree + data.degree);
    return valid;
  }

  String _getFitString(String title, double percent, double maxWidth) {
    bool fit = false;
    bool needSubstr = false;
    String result = title;
    int range = title.length;
    do {
      final tp = TextPainter(
        text: TextSpan(
          text: "$result${needSubstr ? "...: " : ": "}${"${percent.floor()}%"}",
          style: pieTextStyle,
        ),
        maxLines: 1,
        textDirection: TextDirection.ltr,
      );
      tp.layout();
      if (tp.width > maxWidth && range > 1) {
        range -= 1;
        needSubstr = true;
        result = result.substring(0, range);
      } else {
        fit = true;
      }
    } while (!fit);
    return "$result${needSubstr ? "...: " : ": "}${"${percent.floor()}%"}";
  }
}

mixin TouchHandler {
  int handleTouch(
    Offset touchInput,
  ) =>
      throw UnsupportedError('not implemented');
}

int sigl(double a) => a < 0 ? -1 : 1;
const double _degrees2Radians = math.pi / 180.0;
double radians(double degrees) => degrees * _degrees2Radians;
const double _radians2Degrees = 180.0 / math.pi;
double degrees(double radians) => radians * _radians2Degrees;
Offset getOffset(double degree, double radius) => Offset(
    radius * math.sin(radians(degree)), radius * math.cos(radians(degree)));
