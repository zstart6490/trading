import 'dart:convert';

import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/cores/storage_services.dart';
import 'package:trading_module/data/entities/stock_model_dto.dart';

abstract class StockStorageService extends StorageServices {
  StockStorageService() : super();

  Future<List<StockModelDTO>> getList();
  Future writeList(List<StockModelDTO> list);

}

class StockStorageServiceImpl extends StockStorageService {
  StockStorageServiceImpl() : super();

  @override
  Future<List<StockModelDTO>> getList() async {
    final value = await box.read(Home_Maket_Cache);
    if (value != null) {
      final users = StockModelDTO.getList(jsonDecode(value.toString()));
      return users;
    }
    return [];
  }

  @override
  Future writeList(List<StockModelDTO> list) async{
    await box.write(Home_Maket_Cache, jsonEncode(list));
  }



}
