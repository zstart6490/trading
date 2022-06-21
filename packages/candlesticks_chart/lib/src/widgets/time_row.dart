// import 'package:candlesticks/src/constant/view_constants.dart';
// import 'package:candlesticks/src/models/candle.dart';
// import 'package:candlesticks/src/theme/theme_data.dart';
// import 'package:flutter/material.dart';
// import 'dart:math' as math;
//
// import 'draw_time.dart';
//
// class TimeRow extends StatefulWidget {
//   final List<Candle> candles;
//   final double candleWidth;
//   final double? indicatorX;
//   final DateTime? indicatorTime;
//   final int index;
//
//   const TimeRow({
//     Key? key,
//     required this.candles,
//     required this.candleWidth,
//     this.indicatorX,
//     required this.indicatorTime,
//     required this.index,
//   }) : super(key: key);
//
//   @override
//   State<TimeRow> createState() => _TimeRowState();
// }
//
// class _TimeRowState extends State<TimeRow> {
//   final ScrollController _scrollController = new ScrollController();
//
//   /// Calculates number of candles between two time indicator
//   int _stepCalculator() {
//     if (widget.candleWidth < 3)
//       return 1;
//     else if (widget.candleWidth < 5)
//       return 1;
//     else if (widget.candleWidth < 7)
//       return 1;
//     else return 1;
//   }
//
//   /// Calculates [DateTime] of a given candle index
//   DateTime _timeCalculator(int step, int index, Duration dif) {
//     int candleNumber = (step + 1) ~/ 2 - 10 + index * step + -1;
//     DateTime? _time;
//     if(step == 365){
//       _time = widget.candles[index].date;
//       return _time;
//     }
//     else {
//       if (candleNumber < 0)
//         _time = widget.candles[0].date.add(Duration(
//             milliseconds: dif.inMilliseconds ~/ -1 * step * candleNumber));
//       else if (candleNumber < widget.candles.length)
//         _time = widget.candles[candleNumber].date;
//       else {
//         _time = widget.candles[0].date/*.subtract(
//             Duration(milliseconds: dif.inMilliseconds ~/ step * candleNumber))*/;
//       }
//       return _time;
//     }
//   }
//
//   /// Fomats number as 2 digit integer
//   String numberFormat(int value) {
//     return "${value < 10 ? 0 : ""}$value";
//   }
//
//   /// Day/month text widget
//   Text _monthDayText(DateTime _time, Color color) {
//     return Text(
//       numberFormat(_time.day) + "/" + numberFormat(_time.month),
//       style: TextStyle(
//         color: color,
//         fontSize: 10,
//       ),
//     );
//   }
//   Text _onlyMonthText(int _month){
//     return Text(
//       "Tháng " + _month.toString(),
//       style: TextStyle(
//         color:  Colors.red,
//         fontSize: 8,
//       ),
//     );
//   }
//
//   String dateFormatter(DateTime date) {
//     return "${numberFormat(date.day)}/${numberFormat(date.month)}/${date.year}";
//   }
//
//   Widget dateItem({required String date}){
//     return Column(
//       mainAxisSize: MainAxisSize.max,
//       children: [
//         Expanded(
//             child: Container(
//               padding: EdgeInsets.zero,
//               margin: EdgeInsets.zero,
//               width: widget.candleWidth,
//               alignment: Alignment.center,
//               child: date == ""
//                   ? SizedBox()
//                   :Container(
//                     width: 0.7,
//                     color: Theme.of(context).grayColor.withOpacity(0.35),
//                   ),
//             )
//         ),
//         Container(
//             padding: EdgeInsets.only(top: 10),
//             color: Theme.of(context).background,
//             width: date == "" ? 0 : widget.candleWidth,
//             height: 30,
//             alignment: Alignment.topCenter,
//             child: date == ""
//               ? SizedBox()
//               : (MediaQuery.of(context).size.width/widget.candleWidth < 150)
//                   ? CustomPaint(painter: DrawTime(date: date),)
//                   : ((current_month - first_month + 1) % 3 != 0)
//                       ? SizedBox()
//                       : CustomPaint(painter: DrawTime(date: date),)
//
//
//         )
//       ],
//     );
//   }
//
//   @override
//   void didUpdateWidget(TimeRow oldWidget) {
//     if (oldWidget.index != widget.index ||
//         oldWidget.candleWidth != widget.candleWidth)
//       _scrollController.jumpTo((widget.index ) * widget.candleWidth);
//     super.didUpdateWidget(oldWidget);
//   }
//   var current_month = 0;
//   var first_month = 0;
//   @override
//   Widget build(BuildContext context) {
//     int step = _stepCalculator();
//     final dif = widget.candles[0].date.difference(widget.candles[1].date) * step;
//     current_month = widget.candles[0].date.month;
//     first_month = widget.candles[0].date.month;
//     return Container(
//       color: Theme.of(context).background,
//       padding: const EdgeInsets.only(right: PRICE_BAR_WIDTH + 1.0),
//       child: Stack(
//         children: [
//           Container(
//             color: Color(0xFFF4F4F4),
//           ),
//           Positioned(
//             bottom: 0,
//             child: Container(
//               color: Theme.of(context).background,
//               width: 1000,
//               height: 30,
//             ),
//           ),
//
//           Container(
//             child: ListView.builder(
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: (widget.candles.length * 2).toInt() , // math.max(widget.candles.length, 1000),
//               scrollDirection: Axis.horizontal,
//               itemExtent: step * widget.candleWidth ,
//               controller: _scrollController,
//               reverse: true,
//               itemBuilder: (context, index) {
//                 if(index == 0 && MediaQuery.of(context).size.width/widget.candleWidth < 30) return dateItem(date: widget.candles[0].date.day.toString());
//                 if(index < widget.candles.length -1 && widget.candles[index+1].date.month != current_month ) {
//                   var displayMonth = current_month;
//                   current_month = widget.candles[index + 1].date.month;
//                   return dateItem(date: "Tháng $displayMonth");
//                 }
//                 else return SizedBox();
//               },
//             ),
//           ),
//           widget.indicatorX == null
//               ? Container()
//               : Positioned(
//                   bottom: 0,
//                   left: math.max(widget.indicatorX! - 55, 0),
//                   child: Container(
//                     padding:EdgeInsets.symmetric(vertical: 2, horizontal: 4) ,
//                     color: Theme.of(context).hoverIndicatorBackgroundColor,
//                     child: Center(
//                       child: Text(
//                         dateFormatter(widget.indicatorTime!),
//                         style: TextStyle(
//                           color: Theme.of(context).hoverIndicatorTextColor,
//                           fontSize: 14,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                     //width: 90,
//                   ),
//                 ),
//         ],
//       ),
//     );
//   }
// }
