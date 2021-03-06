
import 'package:trading_module/domain/entities/cash_in_confirm_model.dart';
import 'package:trading_module/domain/entities/cash_in_create_model.dart';

import '../../cores/resources/data_state.dart';


abstract class CashInRepo {

  Future<DataState<CashInCreateModel>> createCashIn({
    required String amount,
  });

  Future<DataState<CashInConfirmModel>> confirmCashIn({
    required String transactionId
  });


}