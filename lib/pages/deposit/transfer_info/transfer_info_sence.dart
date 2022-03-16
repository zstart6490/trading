import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:tikop/modules/deposit/transfer_info/component/bank_info/bank_info.dart';
// import 'package:tikop/modules/deposit/transfer_info/transfer_info_controller.dart';
// import 'package:tikop/modules/support_fab/support_fab.dart';
// import 'package:tikop/shared_widgets/BaseScaffold.dart';
// import 'package:tikop/shared_widgets/CustomButton.dart';
// import 'package:tikop/shared_widgets/GuideComponent.dart';
// import 'package:tikop/theme/app_color.dart';
// import 'package:tikop/utils/util.dart';


import 'package:trading_module/pages/deposit/transfer_info/component/bank_info/bank_info.dart';
import 'package:trading_module/pages/deposit/transfer_info/transfer_info_controller.dart';
import 'package:trading_module/pages/support_fab/support_fab.dart';
import 'package:trading_module/shared_widgets/BaseScaffold.dart';
import 'package:trading_module/shared_widgets/CustomButton.dart';
import 'package:trading_module/shared_widgets/GuideComponent.dart';
import 'package:trading_module/theme/app_color.dart';
import 'package:trading_module/utils/util.dart';
import 'component/bank_list.dart';

class TDTransferInfoScene extends GetView<TDTransferInfoController> {
  const TDTransferInfoScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar<TDTransferInfoController>(
      title: "Thông tin chuyển khoản",
      showBackBtn: false,
      fab: const SupportFAB(
        hasBottomBar: true,
        shouldShowFull: false,
        padBot: kBottomNavigationBarHeight,
      ),
      body: controller.obx(
        (transaction) => Column(
          children: [
            Expanded(
              child: ListView(
                physics: const ScrollPhysics(),
                children: [
                  SIZED_BOX_H24,
                  Padding(
                    padding: PAD_SYM_H16,
                    child: Text(
                      'Chuyển khoản từ ngân hàng của bạn đến một trong những tài khoản sau:',
                      style: context.textSize14.copyWith(
                          fontWeight: FontWeight.w500,
                          color: COLOR_NEUTRAL_500),
                    ),
                  ),
                  Obx(() => BankListComponent(
                        scrollController: controller.scrollController,
                        bankKey: controller.bankKey,
                        banks: controller.banks.toList(),
                        selectedBank: controller.selectedBank.value,
                        onSelectedIndex: (index) =>
                            controller.onSelectedIndex(index),
                      )),
                  Padding(
                    padding: PAD_SYM_H16,
                    child: Obx(() => BankInfoComponent(
                        bankAccountKey: controller.accountNumberKey,
                        bankContentKey: controller.paymentContentKey,
                        bank: controller.selectedBank.value,
                        amount: controller.data.amount,
                        content: transaction!.content)),
                  ),
                  SIZED_BOX_H16,
                  const Padding(
                    padding: PAD_SYM_H16,
                    child: GuideComponent(
                      desc1:
                          "Bạn gặp khó khăn khi nạp tiền? Vui lòng bấm xem hướng dẫn sau",
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: PAD_BOTTOM_16,
              child: CustomButton.defaultStyle(
                title: "Về trang chủ",
                onPressed: () => controller.onSelectBackHome(),
              ),
            ),
          ],
        ),
        onLoading: const SizedBox(),
      ),
    );
  }
}
