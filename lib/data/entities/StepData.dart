
import 'package:trading_module/utils/enums.dart';

class StepData {
  final StepStatus stepStatus;
  final String title;
  final String? desc;
  final String? descLv2;
  final bool isLast;
  StepData({
    required this.stepStatus,
    required this.title,
    this.desc,
    this.descLv2,
    this.isLast = false,
  });
  factory StepData.step1({String title = "Xác nhận giao dịch"}) {
    return StepData(title: title, desc: " ", stepStatus: StepStatus.done);
  }

  factory StepData.step2(
      {String title = "Tikop đang xử lý giao dịch",
      required String desc,
      String? descLv2,
      StepStatus stepStatus = StepStatus.progressing}) {
    return StepData(
        title: title,
        desc: desc,
        descLv2: descLv2,
        stepStatus: stepStatus,
        isLast: true);
  }
}
