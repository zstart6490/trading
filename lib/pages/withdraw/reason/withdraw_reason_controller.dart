import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/data/entities/reason.dart';
import 'package:trading_module/domain/entities/navigate_withdraw_data.dart';
import 'package:trading_module/pages/withdraw/reason/other_reason_popup.dart';
import 'package:trading_module/routes/app_routes.dart';
import 'package:trading_module/shared_widgets/CustomAlertDialog.dart';


class WithdrawReasonController extends BaseController {

  final NavigateWithdrawData data;

  WithdrawReasonController(this.data);


  void showOtherReasonPopup() {
    final other = Reason.other();
    final textController = TextEditingController();
    final otherReasonDialog = CustomReasonAlertDialog(
      title: other.reason,
      textController: textController,
      hintText: "Lý do của bạn....",
      actions: [
        AlertAction(
            text: "Bỏ qua",
            isDestructiveAction: true,
            onPressed: () {
              hideDialog();
              handlerNavigator();
            }),
        AlertAction.ok(
          () {
            hideDialog();
            other.note = textController.text;
            data.selectedReason = other;
            handlerNavigator();
          },
        ),
      ],
    );
    showAlertDialog(otherReasonDialog);
  }

  void handlerNavigator() {
    Get.toNamed(AppRoutes.withdrawMoney, arguments: data);
  }

  void selectedReason(Reason reason) {
    data.selectedReason = reason;
    if (reason.id == Reason.other().id) {
      showOtherReasonPopup();
    } else {
      handlerNavigator();
    }
  }
}
