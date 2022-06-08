import 'dart:convert';
import 'package:trading_module/cores/storage_services.dart';


abstract class LocalStorageService extends StorageServices {
  LocalStorageService() : super();

  dynamic getObject(String key);
  void writeObject(String key, dynamic list);

}

class LocalStorageServiceImpl extends LocalStorageService {
  LocalStorageServiceImpl() : super();

  @override
  dynamic getObject(String key) {
    final value = box.read(key);
    return value;
  }

  @override
  void writeObject(String key, dynamic value) {
     box.write(key, jsonEncode(value));
  }
}
