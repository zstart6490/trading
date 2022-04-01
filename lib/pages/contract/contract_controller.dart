import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:internet_file/internet_file.dart';
import 'package:pdfx/pdfx.dart';
import 'package:trading_module/configs/service_api_config.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/routes/app_routes.dart';

class ContractController extends BaseController {
  String pdfPath;
  late PdfControllerPinch pdfController;

  ContractController(this.pdfPath);

  @override
  void onInit() {
    String pdfLink =
        "${Environment().backendUrl}/resource/v1/download-contract/$pdfPath";
    if (kDebugMode) {
      print(pdfLink);
    }
    pdfController = PdfControllerPinch(
      document: PdfDocument.openData(InternetFile.get(pdfLink)),
    );
    super.onInit();
  }

  void openHomeTrading() {
    Get.offAndToNamed(AppRoutes.mainView);
  }
}
