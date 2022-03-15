import 'package:math_expressions/math_expressions.dart';
import 'package:tikop/models/SavingProduct.dart';
import 'package:trading_module/utils/date_utils.dart';
import 'package:trading_module/utils/extensions.dart';
import 'package:tikop/base/stateManagement/base_controller.dart';

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

class TDBaseInterstController extends BaseController {
  SavingProduct? selectedProduct;
  List<InterestData> interestDataList = <InterestData>[];
  int maxAmount = 0;
  void caculateInterest(int money) {
    if (selectedProduct != null) {
      interestDataList.clear();
      final mathInterest = selectedProduct!.mathInterest!;
      for (final month in selectedProduct!.month!) {
        final now = DateTime.now();
        final endDate = DateTime(now.year, now.month + month, now.day, now.hour,
            now.minute + 1, now.second);
        final dayDiff = endDate.difference(now).inDays;
        final ContextModel cm = ContextModel();
        cm.bindVariable(Variable("amount"), Number(money));
        cm.bindVariable(Variable("day"), Number(dayDiff));
        final Parser p = Parser();
        final Expression exp = p.parse(mathInterest);
        final double interest = exp.evaluate(EvaluationType.REAL, cm) as double;
        interestDataList
            .add(InterestData(month: month, interest: interest.floor()));
      }
      update();
    } else {}
  }
}
