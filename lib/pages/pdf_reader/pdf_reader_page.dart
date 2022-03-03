import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';
import 'package:trading_module/pages/pdf_reader/pdf_reader_controller.dart';
import 'package:trading_module/shared_widgets/BaseScaffold.dart';

class PdfReadePager extends GetView<PdfReaderController> {

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar<PdfReaderController>(
        backgroundColor: Colors.white,
        title: controller.title,
        body: PdfViewPinch(
          controller: controller.pdfController,
        ));
  }
}
