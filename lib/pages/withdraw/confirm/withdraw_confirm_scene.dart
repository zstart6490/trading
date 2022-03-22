import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/pages/withdraw/choose_money/components/withdraw_bank_component.dart';
import 'package:trading_module/pages/withdraw/confirm/withdraw_controller.dart';
import 'package:trading_module/shared_widgets/BaseScaffold.dart';
import 'package:trading_module/shared_widgets/CustomButton.dart';
import 'package:trading_module/theme/app_color.dart';
import 'package:trading_module/utils/extensions.dart';

class WithdrawConfirmScene extends GetView<WithdrawController> {
  const WithdrawConfirmScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar<WithdrawController>(
      title: "Xác nhận giao dịch",
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: const ScrollPhysics(),
              children: [
                Container(
                  color: context.backgroundColor,
                  child: Padding(
                    padding: PAD_ALL16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nguồn Tiền Được Rút",
                          style: context.textSize16,
                        ),
                        SIZED_BOX_H12,
                        Container(
                          padding: PAD_ALL16,
                          decoration: BoxDecoration(
                            color: context.scaffoldBackgroundColor,
                            borderRadius: BOR_RAD8,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Tài khoản đầu tư chứng khoán",
                                style: context.textSize14.copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: COLOR_858585),
                              ),
                              Expanded(
                                child: AutoSizeText(
                                  (controller.withdrawInfo.balance)
                                      .toCurrency(),
                                  style: context.textSize14.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: COLOR_333333),
                                  textAlign: TextAlign.end,
                                ),
                              )
                            ],
                          ),
                        ),
                        SIZED_BOX_H08,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Số tiền được rút",
                              style: context.textSize16,
                              textAlign: TextAlign.end,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 11.0),
                              child: AutoSizeText(
                                (controller.withdrawInfo.amount)
                                    .toCurrency(),
                                style: context.textSize14.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                        SIZED_BOX_H08,
                        _Cell(
                          title: "Phí giao dịch",
                          detail: (controller.withdrawInfo.feeAmount)
                              .toCurrency(),
                        ),
                        SIZED_BOX_H08,
                        _Cell(
                          title: "Số tiền thực nhận",
                          detail: (controller.withdrawInfo.receiveAmount)
                              .toCurrency(),
                          detailStyle: context.textSize14.copyWith(
                              color: context.primaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                        SIZED_BOX_H08,
                        _Cell(
                          title: "Số tiền còn lại",
                          detail: (controller.withdrawInfo.remainingBalance)
                              .toCurrency(),
                        ),
                      ],
                    ),
                  ),
                ),
                SIZED_BOX_H16,
                const WithdrawBankComponent()
              ],
            ),
          ),
          Padding(
            padding: PAD_BOTTOM_16,
            child: CustomButton.iconStyle(
              icon: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.shield,
                    color: context.backgroundColor,
                  ),
                  Icon(
                    Icons.lock,
                    color: context.primaryColor,
                    size: 12,
                  ),
                ],
              ),
              title: "Xác nhận giao dịch",
              onPressed: () => controller.onConfirm(),
            ),
          ),
        ],
      ),
    );
  }
}

class _Cell extends StatelessWidget {
  const _Cell({
    Key? key,
    required this.title,
    required this.detail,
    this.detailStyle,
  }) : super(key: key);

  final String title;
  final String detail;
  final TextStyle? detailStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 11.0),
      child: Row(
        children: [
          SIZED_BOX_W12,
          Text(
            title,
            style: context.textSize14.copyWith(color: COLOR_858585),
            textAlign: TextAlign.end,
          ),
          Expanded(
            child: AutoSizeText(
              detail,
              style: detailStyle ??
                  context.textSize14.copyWith(color: context.disabledColor),
              textAlign: TextAlign.right,
            ),
          )
        ],
      ),
    );
  }
}
