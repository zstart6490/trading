import 'package:flutter/material.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/pages/transaction/transaction_detail_controller.dart';
import 'package:trading_module/shared_widgets/CustomButton.dart';

class BottomComponent extends StatelessWidget {
  const BottomComponent({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TransactionDetailController controller;

  @override
  Widget build(BuildContext context) {
    // if (controller.mData.hasBtn) {
      return Padding(
        padding: PAD_BOTTOM_16,
        child: CustomButton.defaultStyle(
            title: "Về trang chủ", onPressed: () => controller.goToHomeTrading()),
      );
    // } else {
    //   return const SizedBox();
    // }
  }
}
