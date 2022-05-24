import 'package:get/get.dart';
import 'package:trading_module/pages/main_provider.dart';
import 'package:trading_module/utils/enums.dart';
import 'package:trading_module/utils/extensions.dart';

class TransactionDetail {
  final String id;
  final String transactionCode;
  final num requestAmount;
  final num amount;
  final num fee;
  final num vat;
  final num receiveAmount;
  final String name;
  final String bankName;
  final String bankCode;
  final String accountName;
  final String accountNo;
  final String content;
  final String methodLabel;
  final String fundsLabel;
  final String pendingStatus;
  final TransactionType type;
  final TransactionMethod method;
  final TransactionState status;
  final DateTime createDate;
  final String statusName;
  final String typeName;

  TransactionDetail(
      {required this.id,
      required this.transactionCode,
      required this.requestAmount,
      required this.amount,
      required this.fee,
      required this.vat,
      required this.receiveAmount,
      required this.name,
      required this.bankName,
      required this.bankCode,
      required this.accountName,
      required this.accountNo,
      required this.content,
      required this.methodLabel,
      required this.fundsLabel,
      required this.pendingStatus,
      required this.type,
      required this.method,
      required this.status,
      required this.createDate,
      required this.statusName,
      required this.typeName});

  String? get getMethodDisplay => _getMethodDisplay();

  TransactionType get getType => type;

  TransactionState get getState => status;

  TransactionMethod get getMethod => method;

  String? _getMethodDisplay() {
    if (methodLabel.hasText) {
      return methodLabel;
    } else {
      return Get.find<MainTradingProvider>()
          .getMethodDisplay(getMethod, type: getType);
    }
  }
}
