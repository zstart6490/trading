import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/cores/states/base_view_model.dart';
import 'package:trading_module/pages/withdraw/choose_money/choose_money_controller.dart';
import 'package:trading_module/theme/app_color.dart';
import 'package:trading_module/utils/enums.dart';
import 'package:trading_module/utils/extensions.dart';
import 'package:trading_module/utils/text_field_utils/numeric_formatter.dart';

class WithdrawAmountComponent extends BaseViewModel<ChooseMoneyController> {
  const WithdrawAmountComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget child(BuildContext context) {
    final isAllin = controller.isAllin.value;
    return Container(
      width: double.infinity,
      color: context.backgroundColor,
      child: Padding(
        padding: PAD_ALL16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 3.0),
              child: Text(
                "Nhập Số Tiền Muốn Rút",
                style: context.textSize16,
              ),
            ),
            SIZED_BOX_H08,
            AbsorbPointer(
              absorbing: controller.mustAllin,
              child: InkWell(
                onTap: () => controller.setAllin(false),
                child: Row(children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        12, 16, 12, 16),
                                    child: TextField(
                                      controller: controller.textEditController,
                                      style: context.textSize28.copyWith(
                                          fontWeight: FontWeight.normal),
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        CurrencyInputFormatter(
                                            maxAmount: (controller
                                                .data.totalMoneyUser*10)
                                                .toInt(),
                                            onOver: () =>
                                                controller.onInputOver())
                                      ],
                                      focusNode: controller.focusNode,
                                      onChanged: (val) =>
                                          controller.onChangedMoney(controller
                                                      .textEditController
                                                      .text !=
                                                  ""
                                              ? int.parse(controller
                                                  .textEditController.text
                                                  .replaceAll(
                                                      RegExp("\\.|,"), ""))
                                              : 0),
                                      decoration: InputDecoration(
                                        isCollapsed: true,
                                        border: const OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        hintText: 0.toCurrency(),
                                        hintStyle: context.textSize28.copyWith(
                                            color: context.disabledColor,
                                            fontWeight: FontWeight.normal),
                                        fillColor: context.backgroundColor,
                                      ),
                                    ))),
                            Visibility(
                              visible: !controller.isEmptyText.value,
                              child: InkWell(
                                onTap: () {
                                  controller.clearText();
                                  controller.onChangedMoney(
                                      controller.textEditController.text != ""
                                          ? int.parse(controller
                                              .textEditController.text
                                              .replaceAll(RegExp("\\.|,"), ""))
                                          : 0);
                                },
                                child: SvgPicture.asset(
                                  "assets/images/svg/ic_close.svg",
                                  width: 16,
                                  height: 16,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 24,
                            ),
                            Icon(
                              !isAllin
                                  ? Icons.check_circle
                                  : Icons.radio_button_off,
                              color: !isAllin
                                  ? context.primaryColor
                                  : context.disabledColor,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        Obx(() => Row(
                              children: [
                                if (controller.validMinMoney.value ==
                                    ConditionState.success)
                                  SvgPicture.asset(
                                    "assets/images/svg/ic_condition_success.svg",
                                    height: 18,
                                  )
                                else
                                  controller.validMinMoney.value ==
                                          ConditionState.none
                                      ? SvgPicture.asset(
                                          "assets/images/svg/ic_condition_none.svg",
                                          height: 18,
                                        )
                                      : SvgPicture.asset(
                                          "assets/images/svg/ic_condition_error.svg",
                                          height: 18,
                                        ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Số tiền rút tối thiểu là ${controller.minMoneyCanWithdraw.toCurrency()}",
                                  style: context.textSize14.copyWith(
                                    color: controller.validMinMoney.value ==
                                            ConditionState.success
                                        ? context.primaryColor
                                        : controller.validMinMoney.value ==
                                                ConditionState.none
                                            ? context.disabledColor
                                            : context.errorColor,
                                  ),
                                )
                              ],
                            )),
                        const SizedBox(
                          height: 17,
                        ),
                        Row(
                          children: [
                            if (controller.validMaxMoney.value ==
                                ConditionState.success)
                              SvgPicture.asset(
                                "assets/images/svg/ic_condition_success.svg",
                                height: 18,
                              )
                            else
                              controller.validMaxMoney.value ==
                                      ConditionState.none
                                  ? SvgPicture.asset(
                                      "assets/images/svg/ic_condition_none.svg",
                                      height: 18,
                                    )
                                  : SvgPicture.asset(
                                      "assets/images/svg/ic_condition_error.svg",
                                      height: 18,
                                    ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Số tiền rút tối đa là ${controller.maxMoneyCanWithdraw.toCurrency()}",
                              style: context.textSize14.copyWith(
                                color: controller.validMaxMoney.value ==
                                        ConditionState.success
                                    ? context.primaryColor
                                    : controller.validMaxMoney.value ==
                                            ConditionState.none
                                        ? context.disabledColor
                                        : context.errorColor,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            SIZED_BOX_H24,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    "Hoặc Rút Toàn Bộ",
                    textAlign: TextAlign.left,
                    style: context.textSize16,
                  ),
                ),
                InkWell(
                  onTap: () => controller.setAllin(true),
                  child: Container(
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: context.scaffoldBackgroundColor),
                      borderRadius: BOR_RAD8,
                    ),
                    child: Padding(
                      padding: PAD_SYM_H12,
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.maxMoneyCanWithdraw.toCurrency(),
                                    style: context.textSize28
                                        .copyWith(color: COLOR_333333),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Icon(
                            isAllin
                                ? Icons.check_circle
                                : Icons.radio_button_off,
                            color: isAllin
                                ? context.primaryColor
                                : context.disabledColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
