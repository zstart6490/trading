import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trading_module/cores/states/base_common_widget.dart';
import 'package:trading_module/data/entities/naptien/VirtualAccount.dart';
import 'package:trading_module/shared_widgets/CustomButton.dart';
import 'package:trading_module/utils/enums.dart';
import 'package:trading_module/utils/util.dart';

class BankAccountNumberRecurring extends StatelessWidget
    with BaseCommonWidgets {
  final Key? bankAccountKey;

  const BankAccountNumberRecurring({Key? key, this.va, this.bankAccountKey})
      : super(key: key);

  final VirtualAccount? va;

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
                  va?.accountNo ?? "",
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
                onPressed: (va != null && va!.accountNo.hasText)
                    ? () {
                        Clipboard.setData(ClipboardData(text: va!.accountNo));
                        showSnackBar("Đã sao chép số tài khoản",
                            type: TdSnackBarType.success);
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
