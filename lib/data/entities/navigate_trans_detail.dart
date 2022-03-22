import 'package:trading_module/domain/entities/transaction_detail.dart';

class NavigateTranDetail{
  bool hasBtn =false;
  TransactionDetail transaction;

  NavigateTranDetail({required this.transaction,required this.hasBtn});
}