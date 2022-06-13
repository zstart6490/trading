import 'package:candlesticks/src/constant/view_constants.dart';
import 'package:candlesticks/src/models/candle.dart';
import 'package:candlesticks/src/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class TimeRow extends StatefulWidget {
  final List<Candle> candles;
  final double candleWidth;
  final double? indicatorX;
  final DateTime? indicatorTime;
  final int index;

  const TimeRow({
    Key? key,
    required this.candles,
    required this.candleWidth,
    this.indicatorX,
    required this.indicatorTime,
    required this.index,
  }) : super(key: key);

  @override
  State<TimeRow> createState() => _TimeRowState();
}

class _TimeRowState extends State<TimeRow> {
  final ScrollController _scrollController = new ScrollController();

  /// Calculates number of candles between two time indicator
  int _stepCalculator() {
    if (widget.candleWidth < 3)
      return 31;
    else if (widget.candleWidth < 5)
      return 19;
    else if (widget.candleWidth < 7)
      return 13;
    else
      return 9;
  }

  /// Calculates [DateTime] of a given candle index
  DateTime _timeCalculator(int step, int index, Duration dif) {
    int candleNumber = (step + 1) ~/ 2 - 10 + index * step + -1;
    DateTime? _time;
    if (candleNumber < 0)
      _time = widget.candles[0].date.add(Duration(
          milliseconds: dif.inMilliseconds ~/ -1 * step * candleNumber));
    else if (candleNumber < widget.candles.length)
      _time = widget.candles[candleNumber].date;
    else {
      _time = widget.candles[0].date.subtract(
          Duration(milliseconds: dif.inMilliseconds ~/ step * candleNumber));
    }
    return _time;
  }

  /// Fomats number as 2 digit integer
  String numberFormat(int value) {
    return "${value < 10 ? 0 : ""}$value";
  }

  /// Day/month text widget
  Text _monthDayText(DateTime _time, Color color) {
    return Text(
      numberFormat(_time.day) + "/" + numberFormat(_time.month),
      style: TextStyle(
        color: color,
        fontSize: 14,
      ),
    );
  }

  /// Hour/minute text widget
  Text _hourMinuteText(DateTime _time, Color color) {
    return Text(
      numberFormat(_time.hour) + ":" + numberFormat(_time.minute),
      style: TextStyle(
        color: color,
        fontSize: 14,
      ),
    );
  }

  String dateFormatter(DateTime date) {
    //return "${date.year}-${numberFormat(date.month)}-${numberFormat(date.day)} ${numberFormat(date.hour)}:${numberFormat(date.minute)}";
    return "${numberFormat(date.day)}/${numberFormat(date.month)}/${date.year}";
  }

  @override
  void didUpdateWidget(TimeRow oldWidget) {
    if (oldWidget.index != widget.index ||
        oldWidget.candleWidth != widget.candleWidth)
      _scrollController.jumpTo((widget.index + 10) * widget.candleWidth);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    int step = _stepCalculator();
    final dif =
        widget.candles[0].date.difference(widget.candles[1].date) * step;
    return Container(
      color: Theme.of(context).background,
      padding: const EdgeInsets.only(right: PRICE_BAR_WIDTH + 1.0),
      child: Stack(
        children: [
          Container(
            color: Color(0xFFF4F4F4),
            // margin: EdgeInsets.only(bottom: 5),
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.candles.length , // math.max(widget.candles.length, 1000),
              scrollDirection: Axis.horizontal,
              itemExtent: step * widget.candleWidth,
              controller: _scrollController,
              reverse: true,
              itemBuilder: (context, index) {
                DateTime _time = _timeCalculator(step, index, dif);
                if (index == 0){
                  return  SizedBox(
                    height: 0,
                    width: 0,
                  );
                }
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: 0.3,
                        color: Color(0x3F9AA0A5),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      color: Theme.of(context).background,
                      width: double.infinity,
                      child: Container( //k can
                        alignment: Alignment.center,
                        child: index != 0
                            ?_monthDayText(_time, Theme.of(context).scaleNumbersColor)
                            : SizedBox(height: 20, width: 100,)
                      )

                    )


                    // dif.compareTo(Duration(days: 1)) > 0
                    //     ? _monthDayText(
                    //         _time, Theme.of(context).scaleNumbersColor)
                    //     : _hourMinuteText(
                    //         _time, Theme.of(context).scaleNumbersColor),
                  ],
                );
              },
            ),
          ),
          widget.indicatorX == null
              ? Container()
              : Positioned(
                  bottom: 0,
                  left: math.max(widget.indicatorX! - 55, 0),
                  child: Container(
                    padding:EdgeInsets.symmetric(vertical: 2, horizontal: 4) ,
                    color: Theme.of(context).hoverIndicatorBackgroundColor,
                    child: Center(
                      child: Text(
                        dateFormatter(widget.indicatorTime!),
                        style: TextStyle(
                          color: Theme.of(context).hoverIndicatorTextColor,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    //width: 90,
                  ),
                ),
        ],
      ),
    );
  }
}
