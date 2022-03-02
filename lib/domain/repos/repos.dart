import 'package:trading_module/cores/resources/data_state.dart';

import '../entities/model.dart';

abstract class ModelRepo {
  Future<DataState<List<Model>>> getListData({
    required DateTime from,
    required DateTime to,
  });
}