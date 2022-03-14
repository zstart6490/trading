import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tikop/modules/deposit/transfer_type/component/bank_type.dart';
import 'package:tikop/modules/deposit/transfer_type/component/nine_pay_type.dart';
import 'package:tikop/modules/deposit/transfer_type/component/saving_product_type.dart';
import 'package:tikop/modules/support_fab/support_fab.dart';
import 'package:tikop/shared_widgets/BaseScaffold.dart';

import 'transfer_type_controller.dart';

class TransferTypeScene extends GetView<TransferTypeController> {
  const TransferTypeScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar<TransferTypeController>(
        title: "Hình thức nạp tiền",
        fab: const SupportFAB(shouldShowFull: false),
        body: ListView(
          children: [
            if (controller.config.showBankingRemote)
              NinePayType(
                title: controller.config.iosBankingTransferTitle ?? "",
                info: controller.config.iosBankingTransferDescription ?? "",
                cost: controller.config.iosBankingTransferFee ?? "",
                onTapped: () => controller.onTapped9Pay(),
              ),
            // if (controller.config.showInternetRemote)
            //   OtherType(
            //     leading: CustomShadowWidget(
            //       width: 50,
            //       height: 50,
            //       child: Image.asset("assets/images/png/ic_new_atm@3x.png"),
            //     ),
            //     title: controller.config.iosInternetBankingTransferTitle ?? "",
            //     info: controller.config.iosInternetBankingTransferDescription ??
            //         "",
            //     cost: controller.config.iosInternetBankingTransferFee ?? "",
            //     onTapped: () => controller.onTappedInternetBanking(),
            //   ),
            if (controller.config.showBankTransfer)
              BankTypeComponent(
                config: controller.config,
                onTapped: () => controller.onTappedBank(),
              ),
            if (controller.config.showSavingProductTranfer)
              Obx(
                () => Column(
                    children:
                        List.generate(controller.listProduct.length, (index) {
                  final product = controller.listProduct[index];
                  return SavingProductType(
                    product: product,
                    cost: controller.config.savingProductTranferFee ?? "0 VNĐ",
                    info: controller.config.savingProductTranferContent1 ?? "",
                    onTapped: () => controller.onTappedProduct(product),
                  );
                })),
              ),
          ],
        ));
  }
}
