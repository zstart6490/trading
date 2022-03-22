import 'package:trading_module/utils/enums.dart';

class Transaction {
  String noticeStatus = "tesst";
  TransactionState state = TransactionState.progressing;
  final TransactionType _type = TransactionType.withdraw;

  TransactionType get getType => _type;
}
