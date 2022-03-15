import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/pages/withdraw/choose_money/components/withdraw_amount_component.dart';
import 'package:trading_module/pages/withdraw/choose_money/components/withdraw_bank_component.dart';
import 'package:trading_module/pages/withdraw/withdraw_controller.dart';
import 'package:trading_module/shared_widgets/BaseScaffold.dart';
import 'package:trading_module/shared_widgets/CustomButton.dart';
import 'package:trading_module/utils/extensions.dart';

class WithdrawMoneyScene extends GetView<WithdrawController> {
  const WithdrawMoneyScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar<WithdrawController>(
      title: "withdraw_title".tr,
      backgroundColor: context.scaffoldBackgroundColor,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: const ScrollPhysics(),
              children: const [
                WithdrawAmountComponent(),
                SIZED_BOX_H16,
                WithdrawBankComponent(),
                SIZED_BOX_H16,
              ],
            ),
          ),
          Padding(
            padding: PAD_BOTTOM_16,
            child: Obx(
              () => CustomButton.iconStyle(
                  icon: Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        Icons.shield,
                        color: context.backgroundColor,
                      ),
                      Icon(
                        Icons.lock,
                        color: controller.canConfirm.value
                            ? context.primaryColor
                            : context.disabledColor,
                        size: 12,
                      ),
                    ],
                  ),
                  title: "withdraw_confirm".tr,
                  onPressed: controller.canConfirm.value
                      ? () => controller.onConfirmAmount()
                      : null),
            ),
          )
        ],
      ),
    );
  }
}
