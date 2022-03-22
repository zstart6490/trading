import 'dart:io';

import 'package:get/get.dart';
import 'package:internet_file/internet_file.dart';
import 'package:internet_file/storage_io.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdfx/pdfx.dart';
import 'package:trading_module/cores/states/base_controller.dart';

class PdfReaderController extends BaseController with StateMixin<PdfControllerPinch> {
   PdfControllerPinch? pdfController;
  final String title;
  final String linkPdf;

  PdfReaderController(this.title, this.linkPdf);

  final storageIO = InternetFileStorageIO();

  @override
  void onInit() async {
    final Directory contractPath = await getApplicationDocumentsDirectory();
    pdfController = PdfControllerPinch(
      document: PdfDocument.openData(InternetFile.get(
        linkPdf,
        storage: storageIO,
        storageAdditional: {
          'filename': Uri.parse(linkPdf).pathSegments.last,
          'location': contractPath.path,
        },
      )),
    );
    change(pdfController,status: RxStatus.success());
    super.onInit();
  }
}
