import 'package:internet_file/internet_file.dart';
import 'package:pdfx/pdfx.dart';
import 'package:trading_module/cores/states/base_controller.dart';

class PdfReaderController extends BaseController{
  late PdfControllerPinch pdfController;
  final String title;
  final String linkPdf;

  PdfReaderController(this.title,this.linkPdf);

  @override
  void onInit() async {
    pdfController = PdfControllerPinch(
        document: PdfDocument.openData(InternetFile.get(
            linkPdf)),
        initialPage: 0);

    super.onInit();
  }
}
