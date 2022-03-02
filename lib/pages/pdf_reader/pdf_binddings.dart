import 'package:get/get.dart';
import 'package:trading_module/pages/pdf_reader/pdf_reader_controller.dart';

class PdfReaderBinding extends Bindings{
  @override
  void dependencies() {
    var arg= Get.arguments;
    Get.lazyPut(() => PdfReaderController(arg as String));
  }

}