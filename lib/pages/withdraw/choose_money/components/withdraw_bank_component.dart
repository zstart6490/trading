import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/cores/states/base_view_model.dart';
import 'package:trading_module/domain/entities/bank.dart';
import 'package:trading_module/pages/withdraw/choose_money/choose_money_controller.dart';
import 'package:trading_module/shared_widgets/BankInfoWidget.dart';
import 'package:trading_module/utils/extensions.dart';

class WithdrawBankComponent extends BaseViewModel<ChooseMoneyController> {
  const WithdrawBankComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget child(BuildContext context) {
    final List<UserBank> userBanks = controller.userBanks;
    return Container(
      width: double.infinity,
      color: context.backgroundColor,
      child: Padding(
        padding: PAD_ALL16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'withdraw_bank'.tr,
              style: context.textSize16,
            ),
            SIZED_BOX_H06,
            if (controller.selectedBank.value == null)
              InkWell(
                  onTap: () => controller.onAddBank(),
                  child: const _AddBankCell())
            else
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final bank = userBanks[index];
                    final isSelected =
                        controller.selectedBank.value?.id == bank.id;
                    return InkWell(
                      onTap: () => controller.onSelectBank(bank),
                      child: BankInfoWidget(
                        accountName: bank.accountName,
                        accountNo: bank.accountNo,
                        imageUrl: bank.bank?.logo,
                        codeBank: bank.bank?.code,
                        borderColor: isSelected
                            ? context.primaryColor
                            : context.disabledColor,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SIZED_BOX_H12,
                  itemCount: userBanks.length),
          ],
        ),
      ),
    );
  }
}

class _AddBankCell extends StatelessWidget {
  const _AddBankCell({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BOR_RAD8, border: Border.all(color: BOR_COLOR)),
        child: Padding(
          padding: PAD_ALL12,
          child: Row(children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.disabledColor.withOpacity(0.3)),
              child: Icon(
                Icons.add,
                color: context.primaryColor,
              ),
            ),
            SIZED_BOX_W12,
            Expanded(
                child: AutoSizeText(
              "Thêm tài khoản ngân hàng",
              style: context.textSize16,
            ))
          ]),
        ));
  }
}
