import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/pages/withdraw/choose_money/choose_money_controller.dart';
import 'package:trading_module/pages/withdraw/choose_money/components/withdraw_amount_component.dart';
import 'package:trading_module/pages/withdraw/choose_money/components/withdraw_bank_component.dart';
import 'package:trading_module/shared_widgets/BaseScaffold.dart';
import 'package:trading_module/shared_widgets/CustomButton.dart';
import 'package:trading_module/utils/extensions.dart';

class WithdrawMoneyScene extends GetView<ChooseMoneyController> {
  const WithdrawMoneyScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar<ChooseMoneyController>(
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
              () => CustomButton(
                  title: "withdraw_continue".tr,
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
