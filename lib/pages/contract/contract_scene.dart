import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';
import 'package:trading_module/pages/contract/contract_controller.dart';
import 'package:trading_module/shared_widgets/BaseScaffold.dart';
import 'package:trading_module/shared_widgets/CustomButton.dart';
import 'package:trading_module/theme/app_color.dart';

class ContractPage extends GetView<ContractController> {
  const ContractPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar<ContractController>(
        backgroundColor: Colors.white,
        title: "contract_title".tr,
        leading: InkWell(
            child: const Icon(Icons.arrow_back_ios, color: COLOR_NEUTRAL_900),
            onTap: () => controller.openHomeTrading()),
        body: Column(
          children: [
            Expanded(
              child: PdfViewPinch(
                controller: controller.pdfController,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 16, right: 16, top: 16, bottom: 16),
              child: CustomButton.defaultStyle(
                title: "contract_invest_now".tr,
                onPressed: () {
                  controller.openHomeTrading();
                },
              ),
            )
          ],
        ));
  }
}
