import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tikop/modules/deposit/components/interest_list_component.dart';
import 'package:tikop/modules/deposit/components/money_helper_component.dart';
import 'package:tikop/modules/deposit/interest_tool/money_text_field.dart';
import 'package:tikop/modules/support_fab/support_fab.dart';
import 'package:tikop/shared_widgets/BaseScaffold.dart';
import 'package:tikop/shared_widgets/CustomButton.dart';
import 'package:tikop/shared_widgets/ValidateComponent.dart';
import 'package:tikop/utils/enums.dart';
import 'package:tikop/utils/util.dart';

import 'input_money_local_controller.dart';

class InputMoneyLocalScene extends GetView<InputMoneyLocalController> {
  const InputMoneyLocalScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isRealEstate = controller.product.isRealEstate;
    return BaseScaffoldAppBar<InputMoneyLocalController>(
        title: isRealEstate ? "Nạp tiền đầu tư BĐS" : "Nạp tiền tích cóp",
        fab: const SupportFAB(
          hasBottomBar: true,
          shouldShowFull: false,
          padBot: kBottomNavigationBarHeight,
        ),
        backgroundColor: context.backgroundColor,
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  SIZED_BOX_H12,
                  Padding(
                    padding: PAD_SYM_H16,
                    child: Text(
                      isRealEstate
                          ? "Nhập Số Tiền Muốn Nạp"
                          : "Nhập Số Tiền Muốn Tích Cóp",
                      style: context.textSize16,
                    ),
                  ),
                  Padding(
                    padding: PAD_ALL16,
                    child: MoneyInputComponent(
                      investType: controller.product.investType,
                      focusNode: controller.focusNode,
                      textEditingController: controller.textEditingController,
                      onChangeMoney: (val) => controller.onChangeMoney(val),
                      multipleOf: controller.product.multipleOf,
                    ),
                  ),
                  Obx(() => Container(
                        padding: PAD_SYM_H16,
                        height: 30,
                        child: ValidateComponent(
                          desc:
                              "Tối thiểu là ${controller.product.minMoneyUser.toCurrency()} trên một giao dịch",
                          state: controller.pasMinAmount.value,
                        ),
                      )),
                  if (isRealEstate)
                    Obx(() => Container(
                          height: 30,
                          padding: PAD_SYM_H16,
                          child: ValidateComponent(
                            desc:
                                "Tối đa là ${controller.product.maxMoneyUser.toCurrency()} trên 1 suất đầu tư",
                            state: controller.pasMaxAmount.value,
                          ),
                        )),
                  if (!isRealEstate)
                    Obx(() => Container(
                          height: 30,
                          padding: PAD_SYM_H16,
                          child: controller.pasMaxAmount.value ==
                                  ConditionState.error
                              ? ValidateComponent(
                                  desc: "Vượt quá hạn mức cho phép",
                                  state: controller.pasMaxAmount.value,
                                )
                              : const SizedBox(),
                        )),
                  const InterestListComponent<InputMoneyLocalController>(),
                  SIZED_BOX_H16,
                ],
              ),
            ),
            Padding(
              padding: PAD_SYM_H16,
              child: Obx(
                () => CustomButton.trailingStyle(
                  title: "Tiếp tục",
                  textStyle: context.textSize18light,
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: context.backgroundColor,
                  ),
                  onPressed:
                      controller.isValid ? () => controller.next() : null,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: GetBuilder<InputMoneyLocalController>(
                builder: (controller) {
                  if (controller.showMoneySuggess) {
                    return MoneyHelperComponent(
                      onTappedMoney: (money) => controller.setMoney(money),
                      amount: controller.inputAmount,
                      minAmount: controller.product.minMoneyUser,
                      maxAmount: controller.maxAmount,
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            )
          ],
        ));
  }
}