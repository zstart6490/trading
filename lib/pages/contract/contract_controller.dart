import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_file/internet_file.dart';
import 'package:pdfx/pdfx.dart';
import 'package:trading_module/configs/service_api_config.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/routes/app_routes.dart';
import 'package:trading_module/shared_widgets/CustomAlertDialog.dart';
import 'package:trading_module/utils/extensions.dart';

class ContractController extends BaseController {
  String pdfPath;
  late PdfControllerPinch pdfController;

  ContractController(this.pdfPath);

  @override
  void onInit() {
    String pdfLink =
        "${Environment().backendUrl}/v1/resource/download-contract/$pdfPath";
    if (kDebugMode) {
      print(pdfLink);
    }
    pdfController = PdfControllerPinch(
        document: PdfDocument.openData(InternetFile.get(pdfLink)),
        );
    super.onInit();
  }

  void showDialogRegisterSuccess() {
    showAlertDialog(CustomAlertDialog(
        titleWidget: "ic_success".pngImage(),
        descWidget: Column(children: const [
          Text(
            "Đăng ký chứng khoán thành công",
            style: TextStyle(
                fontStyle: FontStyle.normal,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'iCielHelveticaNowText',
                decoration: TextDecoration.none,
                fontSize: 16),
          ),
          SizedBox(height: 6,),
          Text(
            "Đăng ký chứng khoán thành công bạn có thể bắt đầu đầu tư ngay bây giờ",
            style: TextStyle(
                color: Colors.black45,
                fontWeight: FontWeight.normal,
                fontFamily: 'iCielHelveticaNowText',
                fontStyle: FontStyle.normal,
                decoration: TextDecoration.none,
                fontSize: 12),
            textAlign: TextAlign.center,
          )
        ]),
        actions: [
          AlertAction(
              text: "Tôi đã hiểu",
              isDefaultAction: true,
              onPressed: () => {
                    //call to KYC tikop
                    hideDialog(),
                    Get.offAndToNamed(AppRoutes.HOME_TRADING)
                  }),
        ]));
  }
}
