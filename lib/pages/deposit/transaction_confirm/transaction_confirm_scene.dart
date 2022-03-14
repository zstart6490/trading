import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tikop/modules/support_fab/support_fab.dart';
import 'package:tikop/shared_widgets/BaseScaffold.dart';
import 'package:tikop/shared_widgets/CustomButton.dart';
import 'package:tikop/shared_widgets/CustomShadow.dart';
import 'package:tikop/shared_widgets/DashLine.dart';
import 'package:tikop/shared_widgets/Seperator/MainSeperator.dart';
import 'package:tikop/utils/enums.dart';
import 'package:tikop/utils/util.dart';

import 'components/recurring_transfer_component.dart';
import 'components/row_content.dart';
import 'components/row_content_have_button.dart';
import 'transaction_confirm_controller.dart';

class TransactionConfirmScene extends GetView<TransactionConfirmController> {
  const TransactionConfirmScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar<TransactionConfirmController>(
        title: 'Xác nhận giao dịch',
        fab: const SupportFAB(
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
                              if (controller.data.target != null)
                                RowContent(
                                  title: 'Phí mua',
                                  value: (fee.buyFee ?? 0).toCurrency(),
                                  isMoney: false,
                                ),
                              if (controller.data.target != null) SIZED_BOX_H12,
                              RowContent(
                                  title: 'Phí dịch vụ',
                                  isMoney: false,
                                  value: fee.fee.toCurrency()),
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
                            if (shouldShowMethod())
                              Padding(
                                padding: PAD_SYM_H16,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Phương Thức Tất Toán',
                                      style: context.textSize14.copyWith(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SIZED_BOX_H12,
                                    Obx(
                                      () => RowContentHaveButton(
                                        title: controller.swapName.value,
                                        onPressChanged: () =>
                                            controller.onChangeSwapProduct(),
                                      ),
                                    ),
                                    SIZED_BOX_H16,
                                  ],
                                ),
                              ),
                            if (shouldShowMethod()) const DashLine(),
                            SIZED_BOX_H16,
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
                                  Obx(
                                    () => RowContentHaveButton(
                                      title: controller.methodName.value,
                                      onPressChanged: () =>
                                          controller.onChangePaymentMethod(),
                                    ),
                                  ),
                                  SIZED_BOX_H24,
                                ],
                              ),
                            ),
                            Obx(() => controller
                                    .shouldShowRecurringTransfer.value
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const DashLine(),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            16.0, 16.0, 10.0, 0.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Nạp tiền định kỳ',
                                              style: context.textSize14
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 8.0),
                                              decoration: BoxDecoration(
                                                borderRadius: BOR_RAD8,
                                                color: const Color(0xFFC2F0D9)
                                                    .withOpacity(0.4),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0,
                                                        vertical: 4.0),
                                                child: Text(
                                                  "Khuyến nghị",
                                                  style: context.textSize12
                                                      .copyWith(
                                                          color: const Color(
                                                              0xFF33CC7F)),
                                                ),
                                              ),
                                            ),
                                            const Spacer(),
                                            Obx(
                                              () => CupertinoSwitch(
                                                  value: controller
                                                      .recurringTransfer.value,
                                                  onChanged: (val) =>
                                                      controller.onToggleSwitch(
                                                          newVal: val)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SIZED_BOX_H08,
                                      Padding(
                                        padding: PAD_SYM_H16,
                                        child: Text(
                                          "Đặt lịch chuyển khoản từ ngân hàng của bạn đến tài khoản của Tikop",
                                          style: context.textSize14.copyWith(
                                              color: context.disabledColor),
                                        ),
                                      ),
                                      Obx(
                                        () => controller.recurringTransfer.value
                                            ? RecurringTransferComponent(
                                                mListVA:
                                                    controller.virtualAccounts,
                                                showDesc1:
                                                    controller.showDesc1.value)
                                            : const SizedBox(),
                                      ),
                                      SIZED_BOX_H24,
                                    ],
                                  )
                                : const SizedBox()),
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

  bool shouldShowMethod() {
    return controller.data.product?.investType == InvestType.normal &&
        (controller.data.product?.isLimited ?? false) &&
        !(controller.data.product?.isRealEstate ?? true);
  }
}