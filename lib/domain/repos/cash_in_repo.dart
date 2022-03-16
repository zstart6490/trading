
import 'package:trading_module/domain/entities/cash_in_model.dart';

import '../../cores/resources/data_state.dart';


abstract class CashInRepo {

  Future<DataState<CashInModel>> createCashIn({
    required String amount,
  });


}