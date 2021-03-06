import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:trading_module/pages/deposit/input_money/money_text_field.dart';
import 'package:trading_module/pages/support_fab/support_fab.dart';
import 'package:trading_module/shared_widgets/BaseScaffold.dart';
import 'package:trading_module/shared_widgets/CustomButton.dart';
import 'package:trading_module/shared_widgets/ValidateComponent.dart';
import 'package:trading_module/utils/enums.dart';
import 'package:trading_module/utils/util.dart';

import 'input_money_local_controller.dart';

class TDInputMoneyLocalScene extends GetView<TDInputMoneyLocalController> {
  const TDInputMoneyLocalScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar<TDInputMoneyLocalController>(
        title: "Nạp tiền đầu tư",
        fab: const TDSupportFAB(
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
                          "Nhập Số tiền muốn nạp",
                      style: context.textSize16,
                    ),
                  ),
                  Padding(
                    padding: PAD_ALL16,
                    child: MoneyInputComponent(
                      investType: InvestType.normal,
                      focusNode: controller.focusNode,
                      textEditingController: controller.textEditingController,
                      onChangeMoney: (val) => controller.onChangeMoney(val),
                      multipleOf: 1, state: ConditionState.none,
                    ),
                  ),
                  Obx(() => Container(
                        padding: PAD_SYM_H16,
                        height: 30,
                        child: ValidateComponent(
                          desc:
                              "Tối thiểu là ${int.parse(controller.mainProvider.configMap?.minMoneyUser ?? "50000").toCurrency()} trên một giao dịch",
                          state: controller.pasMinAmount.value,
                        ),
                      )),
                    Obx(() => Container(
                          height: 30,
                          padding: PAD_SYM_H16,
                          child: ValidateComponent(
                            desc:
                                "Tối đa là ${int.parse(controller.mainProvider.configMap?.maxMoneyUser ?? "1000000000").toCurrency()} trên 1 suất đầu tư",
                            state: controller.pasMaxAmount.value,
                          ),
                        )),
                  //const InterestListComponent<TDInputMoneyLocalController>(),
                  SIZED_BOX_H16,
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: (MediaQuery.of(context).viewInsets.bottom) + 16,
                  top: 16),
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
          ],
        ));
  }
}

