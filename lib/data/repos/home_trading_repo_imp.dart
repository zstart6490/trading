import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/cores/networking/result.dart';
import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/data/entities/account_model_dto.dart';
import 'package:trading_module/data/services/home_trading_service.dart';
import 'package:trading_module/domain/entities/account_info_model.dart';
import 'package:trading_module/domain/repos/home_trading_repo.dart';

class HomeTradingRepoImpl extends HomeTradingRepo {
  final HomeTradingService _services;

  HomeTradingRepoImpl(this._services);

  @override
  Future<DataState<AccountInfoModel>> getAccountInfo() async {
    final result = await _services.getAccountInfo();
    if (result.success) {
      final model = result.modelDTO.toModel();

      final box = GetStorage();
      box.write(Home_Cache, jsonEncode(result.modelDTO.toJson()));

      return DataSuccess(model);
    }
    return DataFailed(result.error);
  }

  @override
  DataState<AccountInfoModel> getCache() {
    final box = GetStorage();
    final value = box.read(Home_Cache);
    if (value != null) {
      final AccountInfoModelDTO user =
      AccountInfoModelDTO.fromJson(jsonDecode(value.toString()));
      return DataSuccess(user.toModel());
    }
    return const DataFailed(null);
  }
}
