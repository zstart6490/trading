import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/data/entities/reason.dart';
import 'package:trading_module/domain/entities/navigate_withdraw_data.dart';
import 'package:trading_module/domain/entities/reason.dart';
import 'package:trading_module/domain/use_cases/withdraw_usecase.dart';
import 'package:trading_module/pages/withdraw/reason/other_reason_popup.dart';
import 'package:trading_module/routes/app_routes.dart';
import 'package:trading_module/shared_widgets/CustomAlertDialog.dart';

class WithdrawReasonController extends BaseController
    with StateMixin<List<Reason>> {
  final NavigateWithdrawData data;
  final WithdrawUseCase _withdrawUseCase = Get.find<WithdrawUseCase>();

  WithdrawReasonController(this.data);

  @override
  void onReady() {
    getReason();
    super.onReady();
  }

  Future getReason() async {
    change([], status: RxStatus.loading());
    final result = data.listReason;
    if (result.isNotEmpty) {
      data.listReason = result;
      change(result, status: RxStatus.success());
    } else {
      change([], status: RxStatus.empty());
    }
  }

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

  Future handlerNavigator() async {
    if (data.selectedReason != null) {
      String reason = data.selectedReason?.reason ?? "";
      if (data.selectedReason?.id == ReasonDto.other().id) {
        reason = data.selectedReason?.note ?? data.selectedReason?.reason ?? "";
      }
      showProgressingDialog();
      final result = await _withdrawUseCase.initCashOut(content: reason);
      hideDialog();
      if (result.data != null) {
        data.transactionId = result.data?.transactionId;
        data.totalMoneyUser = result.data?.balance ?? 0;
        if (data.transactionId != null) {
          Get.toNamed(AppRoutes.withdrawMoney, arguments: data);
        } else {
          showSnackBar("Giao dịch thất bại! Liên hệ để được hỗ trợ.");
        }
      } else if (result.error != null) {
        showSnackBar(result.error!.message);
      }
    }
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
