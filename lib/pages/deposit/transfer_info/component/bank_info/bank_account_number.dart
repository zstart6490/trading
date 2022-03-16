import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:tikop/base/stateManagement/base_common_widget.dart';
// import 'package:tikop/models/Bank.dart';
// import 'package:tikop/shared_widgets/CustomButton.dart';
// import 'package:tikop/utils/enums.dart';
// import 'package:tikop/utils/util.dart';
import 'package:trading_module/cores/states/base_common_widget.dart';
import 'package:trading_module/data/entities/naptien/Bank.dart';
import 'package:trading_module/shared_widgets/CustomButton.dart';
import 'package:trading_module/utils/enums.dart';
import 'package:trading_module/utils/util.dart';

class BankAccountNumber extends StatelessWidget with BaseCommonWidgets {
  final Key? bankAccountKey;
  const BankAccountNumber({Key? key, this.bank, this.bankAccountKey})
      : super(key: key);

  final OurBank? bank;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: bankAccountKey,
      margin: PAD_ALL16,
      decoration: BoxDecoration(
        borderRadius: BOR_RAD8,
        color: context.scaffoldBackgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Số tài khoản",
                  style:
                      context.textSize14.copyWith(color: context.disabledColor),
                ),
                SIZED_BOX_H06,
                Text(
                  bank?.accountNumber ?? "",
                  style: context.textSize14,
                )
              ],
            ),
            const Spacer(),
            SizedBox(
              width: 96,
              height: 35,
              child: CustomButton(
                title: "Sao chép",
                textStyle:
                    context.textSize12.copyWith(color: context.backgroundColor),
                onPressed: (bank != null && bank!.accountNumber.hasText)
                    ? () {
                        Clipboard.setData(
                            ClipboardData(text: bank!.accountNumber));
                        showSnackBar("Đã sao chép số tài khoản",
                            type: SnackBarType.success);
                      }
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
