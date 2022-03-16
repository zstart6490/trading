import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:tikop/shared_widgets/CustomAlertDialog.dart';
// import 'package:tikop/utils/util.dart';
import 'package:trading_module/shared_widgets/CustomAlertDialog.dart';
import 'package:trading_module/utils/util.dart';

class PopupSettlement extends StatelessWidget {
  const PopupSettlement({
    Key? key,
    required this.total,
    required this.desc1,
    required this.desc2,
    required this.onCancel,
    required this.onAccept,
  }) : super(key: key);

  final String desc1;
  final String desc2;
  final double total;
  final Function onCancel;
  final Function onAccept;

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
        title: "Tất toán gói tích luỹ cho giao dịch",
        descWidget: RichText(
          textAlign: TextAlign.center,
          text:
              TextSpan(text: desc1, style: Get.context!.textSize14, children: [
            TextSpan(
              text: total.toCurrency(),
              style: Get.context!.textSize14.copyWith(
                color: Get.context!.primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextSpan(
              text: desc2,
            )
          ]),
        ),
        actions: [
          AlertAction(
            text: "Chọn lại",
            onPressed: () => onCancel(),
          ),
          AlertAction(
            text: "Tất toán",
            isDefaultAction: true,
            onPressed: () => onAccept(),
          )
        ]);
  }
}
