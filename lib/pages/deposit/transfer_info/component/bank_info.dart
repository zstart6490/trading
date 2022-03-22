import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trading_module/cores/states/base_common_widget.dart';
import 'package:trading_module/data/entities/naptien/Transaction.dart';
import 'package:trading_module/domain/entities/cash_in_confirm_model.dart';
import 'package:trading_module/shared_widgets/CustomButton.dart';
import 'package:trading_module/shared_widgets/CustomShadow.dart';
import 'package:trading_module/utils/enums.dart';
import 'package:trading_module/utils/util.dart';

import 'bank_info/bank_account_number.dart';

class BankInfoComponent extends StatelessWidget {
  final BankCashInModel bank;
  final Transaction transaction;
  final int amount;
  const BankInfoComponent(
      {Key? key,
      required this.bank,
      this.amount = 0,
      required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomShadow(
      child: Column(
        children: [
          BankAccountNumber(bank: bank),
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
                    bank.accountName ?? "",
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
          TransferInfo(
            content: transaction.content ?? "",
          ),
        ],
      ),
    );
  }
}

// class BankAccountNumber extends StatelessWidget with BaseCommonWidgets {
//   const BankAccountNumber({
//     Key? key,
//     this.bank,
//   }) : super(key: key);

//   final OurBank? bank;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: PAD_ALL16,
//       decoration: BoxDecoration(
//         borderRadius: BOR_RAD8,
//         color: context.scaffoldBackgroundColor,
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Padding(
//           padding: const EdgeInsets.all(4.0),
//           child: Row(
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Số tài khoản",
//                     style: context.textSize14
//                         .copyWith(color: context.disabledColor),
//                   ),
//                   SIZED_BOX_H06,
//                   Text(
//                     bank?.accountNumber ?? "",
//                     style: context.textSize14,
//                   )
//                 ],
//               ),
//               const Spacer(),
//               SizedBox(
//                 width: 96,
//                 height: 35,
//                 child: CustomButton(
//                   title: "Sao chép",
//                   textStyle: context.textSize12
//                       .copyWith(color: context.backgroundColor),
//                   onPressed: (bank != null && bank!.accountNumber.hasText)
//                       ? () {
//                           Clipboard.setData(
//                               ClipboardData(text: bank!.accountNumber));
//                           showSnackBar("Đã sao chép số tài khoản",
//                               type: SnackBarType.success);
//                         }
//                       : null,
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class TransferInfo extends StatelessWidget with BaseCommonWidgets {
  const TransferInfo({
    Key? key,
    required this.content,
  }) : super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: PAD_ALL16,
      decoration: BoxDecoration(
        borderRadius: BOR_RAD8,
        color: context.scaffoldBackgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nội dung chuyển khoản",
                          style: context.textSize14
                              .copyWith(color: context.disabledColor),
                        ),
                        SIZED_BOX_H06,
                        Text(
                          content,
                          style: context.textSize14
                              .copyWith(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 96,
                    height: 35,
                    child: CustomButton(
                      title: "Sao chép",
                      textStyle: context.textSize12
                          .copyWith(color: context.backgroundColor),
                      onPressed: (content.isNotEmpty)
                          ? () {
                              Clipboard.setData(ClipboardData(text: content));
                              showSnackBar("Đã sao chép nội dung chuyển khoản",
                                  type: TdSnackBarType.success);
                            }
                          : null,
                    ),
                  )
                ],
              ),
              SIZED_BOX_H12,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    "assets/images/svg/ic_condition_info.svg",
                  ),
                  SIZED_BOX_W06,
                  Expanded(
                    child: AutoSizeText(
                      "Nhập chính xác nội dung chuyển khoản để hệ thống có thể nạp đúng vào tài khoản Tikop của bạn",
                      style: context.textSize14.copyWith(color: Colors.blue),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
