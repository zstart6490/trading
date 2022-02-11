import 'package:trading_project/data/entities/model.dart';
import 'package:trading_project/data/services/api_services.dart';
import 'package:trading_project/data/services/data_state.dart';
import 'package:trading_project/domain/entities/model.dart';
import 'package:trading_project/domain/repos/repos.dart';

class ModelRepoImpl extends ModelRepo {
  final ApiServices _services;

  ModelRepoImpl(this._services);

  @override
  Future<DataState<List<Model>>> getListData(
      {required DateTime from, required DateTime to}) async {
    final result = await _services.fetchAllCases(from, to);
    if (result.response.success) {
      var listRes = result.data.map((e) => e.toModel()).toList();
      return DataSuccess(listRes);
    }
    return DataFailed(result.response.error);
  }
}
