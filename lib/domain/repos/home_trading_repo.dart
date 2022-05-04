import 'package:trading_module/domain/entities/account_info_model.dart';


import '../../cores/resources/data_state.dart';


abstract class HomeTradingRepo {

  Future<DataState<AccountInfoModel>> getAccountInfo();

  DataState<AccountInfoModel> getCache();
}