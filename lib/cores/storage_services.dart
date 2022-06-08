import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trading_module/pages/main_provider.dart';

class StorageServices {
  final MainTradingProvider mainProvider = Get.find<MainTradingProvider>();
  GetStorage get box => mainProvider.box;


}
