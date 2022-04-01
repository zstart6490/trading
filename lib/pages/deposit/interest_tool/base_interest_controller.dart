import 'package:math_expressions/math_expressions.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/utils/date_utils.dart';
import 'package:trading_module/utils/extensions.dart';


class InterestData {
  final int month;
  final int interest;

  InterestData({this.month = 0, this.interest = 0});

  String get monthDisplay => "$month Tháng";
  String get endTime => _getEndTime();
  String get money => _getMoney();

  String _getEndTime() {
    final now = DateTime.now();
    final endDate = DateTime(
        now.year, now.month + month, now.day, now.hour, now.minute, now.second);
    return "Đến ${endDate.toStringFormat(DateFormater.DotDDMMYYYY)}";
  }

  String _getMoney() {
    return "+${interest.toCurrency()}";
  }
}


