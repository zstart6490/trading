import 'package:trading_project/data/services/data_state.dart';

import '../entities/model.dart';

abstract class ModelRepo {
  Future<DataState<List<Model>>> getListData({
    required DateTime from,
    required DateTime to,
  });
}