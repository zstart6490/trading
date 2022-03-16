import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
// import 'package:tikop/models/Bank.dart';
// import 'package:tikop/shared_widgets/CustomShadow.dart';
// import 'package:tikop/utils/util.dart';
import 'package:trading_module/data/entities/naptien/Bank.dart';
import 'package:trading_module/shared_widgets/CustomShadow.dart';
import 'package:trading_module/utils/util.dart';

import 'bank_account_number.dart';
import 'notice_transfer.dart';
import 'transfer_info.dart';

class BankInfoComponent extends StatelessWidget {
  final OurBank? bank;
  final String? content;
  final int amount;
  final Key? bankContentKey;
  final Key? bankAccountKey;
  const BankInfoComponent({
    Key? key,
    this.bankContentKey,
    this.bankAccountKey,
    this.bank,
    this.amount = 0,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomShadow(
      child: Column(
        children: [
          BankAccountNumber(
            bank: bank,
            bankAccountKey: bankAccountKey,
          ),
          Padding(
            padding: PAD_SYM_H24,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Chủ tài khoản",
                  style:
                      context.textSize14.copyWith(color: context.disabledColor),
                ),
                SIZED_BOX_W12,
                Expanded(
                  child: AutoSizeText(
                    bank?.accountName ?? "",
                    textAlign: TextAlign.end,
                    maxLines: 2,
                    minFontSize: 14,
                    overflow: TextOverflow.ellipsis,
                    style: context.textSize14,
                  ),
                ),
              ],
            ),
          ),
          SIZED_BOX_H06,
          Padding(
            padding: PAD_SYM_H24,
            child: Row(
              children: [
                Text(
                  "Số tiền",
                  style:
                      context.textSize14.copyWith(color: context.disabledColor),
                ),
                Expanded(
                  child: Text(
                    amount.toCurrency(),
                    textAlign: TextAlign.end,
                    style: context.textSize14.copyWith(
                        color: context.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          if (content.hasText)
            TransferInfo(
              paymentContentKey: bankContentKey,
              content: content!,
            ),
          if (content.hasText) const NoticeTransfer(),
          SIZED_BOX_H24
        ],
      ),
    );
  }
}
