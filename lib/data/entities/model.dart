
import '../../domain/entities/model.dart';

class ModelDTO {
  final String gstId;
  final DateTime startTime;
  final String link;

  ModelDTO.fromApi(Map<String, dynamic> map)
      : gstId = map['gstID'],
        startTime = DateTime.parse(map['startTime']),
        link = map['link'];
}

extension ModelMapper on ModelDTO {
  Model toModel() {
    return Model(gstId: gstId, startTime: startTime);
  }
}
