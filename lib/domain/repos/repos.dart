import '../entities/model.dart';

abstract class ModelRepo {
  Future<List<Model>> getListData({
    required DateTime from,
    required DateTime to,
  });
}