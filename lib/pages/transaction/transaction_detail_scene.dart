import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/pages/transaction/components/bottom_component.dart';
import 'package:trading_module/pages/transaction/components/state/transaction_state.dart';
import 'package:trading_module/pages/transaction/components/withdraw_saving.dart';
import 'package:trading_module/pages/transaction/transaction_detail_controller.dart';
import 'package:trading_module/shared_widgets/BaseScaffold.dart';

class TransactionDetailScene extends GetView<TransactionDetailController> {
  const TransactionDetailScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransactionDetailController>(
      builder: (controller) => BaseScaffoldAppBar<TransactionDetailController>(
        backgroundColor: Colors.white,
        title: controller.getTitle(),
        elevation: 0,
        showBackBtn: controller.mData.hasBtn,
        body: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      children: [
                        TransactionStateComponent(controller.mData.transaction),
                        WithdrawSavingInfo(controller.mData.transaction),
                      ],
                    ))),
            BottomComponent(controller: controller),
          ],
        ),
      ),
    );
  }
}
