import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:trading_module/pages/support_fab/support_fab.dart';
import 'package:trading_module/shared_widgets/BaseScaffold.dart';

import 'package:trading_module/shared_widgets/CustomButton.dart';
import 'package:trading_module/shared_widgets/CustomShadow.dart';
import 'package:trading_module/shared_widgets/DashLine.dart';
import 'package:trading_module/shared_widgets/Seperator/MainSeperator.dart';
import 'package:trading_module/utils/enums.dart';
import 'package:trading_module/utils/util.dart';

import 'components/row_content.dart';
import 'components/row_content_have_button.dart';
import 'transaction_confirm_controller.dart';

class TDTransactionConfirmScene
    extends GetView<TDTransactionConfirmController> {
  const TDTransactionConfirmScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar<TDTransactionConfirmController>(
        title: 'Xác nhận giao dịch',
        fab: const TDSupportFAB(
          hasBottomBar: true,
          shouldShowFull: false,
          padBot: kBottomNavigationBarHeight,
        ),
        body: Padding(
          padding: PAD_SYM_H12,
          child: controller.obx(
            (fee) => Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    children: [
                      CustomShadow(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Padding(
                          padding: PAD_SYM_H16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SIZED_BOX_H24,
                              Text(
                                'Thông Tin Giao Dịch',
                                style: context.textSize14
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                              SIZED_BOX_H12,
                              RowContent(
                                  title: 'Số tiền cần chuyển',
                                  value: fee!.totalAmount.toCurrency()),
                              SIZED_BOX_H12,
                              RowContent(
                                  title: 'Phí dịch vụ',
                                  isMoney: false,
                                  value: fee.feeAmount.toCurrency()),
                              SIZED_BOX_H12,
                              RowContent(
                                  title: 'Tiền nạp',
                                  value: fee.amount.toCurrency()),
                              SIZED_BOX_H12
                            ],
                          ),
                        ),
                      ),
                      const MainSeparator(),
                      CustomShadow(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                        ),
                        child: Column(
                          children: [
                            SIZED_BOX_H08,
                            Padding(
                              padding: PAD_SYM_H16,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hình Thức Nạp Tiền',
                                    style: context.textSize14
                                        .copyWith(fontWeight: FontWeight.w500),
                                  ),
                                  SIZED_BOX_H12,
                                  RowContentHaveButton(
                                    title: fee.paymentMethod?.first.title ?? "",
                                    onPressChanged: () =>
                                        controller.onChangePaymentMethod(),
                                  ),
                                  SIZED_BOX_H24,
                                ],
                              ),
                            ),
                            const SizedBox(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                CustomButton.defaultStyle(
                  title: "Xác nhận",
                  onPressed: () {
                    controller.onConfirm();
                  },
                ),
                SIZED_BOX_H16
              ],
            ),
            onLoading: const SizedBox(),
          ),
        ));
  }
}
