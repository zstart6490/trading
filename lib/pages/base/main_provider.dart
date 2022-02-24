import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainProvider {
  GetStorage get box => GetStorage();
  RxBool enableSmartOtp = false.obs;
}