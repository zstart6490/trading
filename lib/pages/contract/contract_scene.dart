import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';
import 'package:trading_module/pages/contract/contract_controller.dart';
import 'package:trading_module/shared_widgets/BaseScaffold.dart';
import 'package:trading_module/shared_widgets/CustomButton.dart';

class ContractPage extends GetView<ContractController> {
  const ContractPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar<ContractController>(
        backgroundColor: Colors.white,
        title: "Hợp đồng sử dụng",
        body: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: PdfViewPinch(
                controller: controller.pdfController,
              )),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 16, right: 16, top: 16, bottom: 16),
              child: CustomButton.defaultStyle(
                title: "verify".tr,
                onPressed: () {
                  controller.showDialogRegisterSuccess();
                },
              ),
            )
          ],
        ));
  }
}
