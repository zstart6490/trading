import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/utils/enums.dart';

import '../../transfer_info_controller.dart';
import 'view_account_number.dart';
import 'view_choice_bank.dart';
import 'view_payment_content.dart';

class OverlayWidget extends GetView<TDTransferInfoController> {
  const OverlayWidget({
    Key? key,
    required this.bankOffset,
    required this.accountNumberOffset,
    required this.paymentContentOffset,
    this.reverseViewPaymentContent = false,
    this.reverseViewAccountNumber = false,
  }) : super(key: key);

  final Offset bankOffset;
  final Offset accountNumberOffset;
  final Offset paymentContentOffset;
  final bool reverseViewPaymentContent;
  final bool reverseViewAccountNumber;

  void onBankContinue() {
    controller.onChoiceBankContinue();
  }

  void onAccountBack() {
    controller.onAccountNumberBack();
  }

  void onAccountContinue() {
    controller.onAccountNumberContinue();
  }

  void onPaymentContinue() {
    controller.onPaymentContentContinue();
  }

  void onPaymentBack() {
    controller.onPaymentContentBack();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final optionGuide = controller.optionGuide.value;

      return Stack(
        children: [
          Positioned(
            left: bankOffset.dx,
            top: bankOffset.dy - 20,
            child: optionGuide == OptionGuide.choiceBank
                ? ViewChoiceBank(
                    onContinue: onBankContinue,
                    bank: controller.banks.first,
                  )
                : const SizedBox.shrink(),
          ),
          Positioned(
            left: accountNumberOffset.dx,
            top: accountNumberOffset.dy,
            child: optionGuide == OptionGuide.bankAccount
                ? ViewAccountNumber(
                    onContinue: onAccountContinue,
                    onBack: onAccountBack,
                    accountNumber: controller.banks.first.accountNo ?? "",
                  )
                : const SizedBox.shrink(),
          ),
          Positioned(
            left: paymentContentOffset.dx,
            top: reverseViewPaymentContent
                ? paymentContentOffset.dy - 191
                : paymentContentOffset.dy,
            child: optionGuide == OptionGuide.paymentContent
                ? ViewPaymentContent(
                    reverseView: reverseViewPaymentContent,
                    onContinue: onPaymentContinue,
                    onBack: onPaymentBack,
                    content: controller.result.transferCode,
                  )
                : const SizedBox.shrink(),
          )
        ],
      );
    });
  }
}
