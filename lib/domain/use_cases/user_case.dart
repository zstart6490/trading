import 'package:trading_project/cores/resources/data_state.dart';

import '../entities/model.dart';
import '../repos/repos.dart';

class ModelUseCase {
  final ModelRepo _geoStormRepo;


  ModelUseCase(this._geoStormRepo);

  Future<DataState<List<Model>>> getLastSolarActivities() async {
    final fromDate = DateTime.now().subtract(const Duration(days: 365));
    final toDate = DateTime.now();

    final storms = await _geoStormRepo.getListData(from: fromDate, to: toDate);
    return storms;
  }
}
