import 'package:get/get.dart';
import 'package:trading_module/pages/pdf_reader/pdf_reader_controller.dart';

class PdfReaderBinding extends Bindings{
  @override
  void dependencies() {
    final title = Get.arguments[0] as String;
    final arg = Get.arguments[1] as String;
    Get.lazyPut(() => PdfReaderController(title,arg));
  }

}