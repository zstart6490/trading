import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tikop/modules/deposit/transfer_info/component/bank_info/frame_content_overlay.dart';
import 'package:tikop/shared_widgets/CustomButton.dart';
import 'package:tikop/utils/util.dart';

class ViewAccountNumber extends StatelessWidget {
  final Function() onContinue;
  final Function() onBack;
  final String accountNumber;
  const ViewAccountNumber(
      {Key? key,
      required this.onContinue,
      required this.onBack,
      required this.accountNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              BankAccountNumberClone(accountNumber: accountNumber),
              SIZED_BOX_H16,
              SvgPicture.asset("assets/images/svg/ic_polygon.svg"),
            ],
          ),
          FrameContent(
            onContinue: onContinue,
            onBack: onBack,
            title: 'Sao chép số tài khoản',
            detail:
                'Sao chép số tài khoản và mở app ngân hàng của bạn để dán hoặc nhập',
          ),
        ],
      ),
    );
  }
}

class BankAccountNumberClone extends StatelessWidget {
  const BankAccountNumberClone({Key? key, required this.accountNumber})
      : super(key: key);

  final String accountNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: PAD_ALL16,
      width: context.screenSize.width - 64,
      decoration: const BoxDecoration(
        borderRadius: BOR_RAD8,
        color: Colors.white,
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
                  textScaleFactor: 1,
                  style:
                      context.textSize14.copyWith(color: context.disabledColor),
                ),
                SIZED_BOX_H06,
                Text(
                  accountNumber,
                  textScaleFactor: 1,
                  style: context.textSize14,
                )
              ],
            ),
            const Spacer(),
            AbsorbPointer(
              child: SizedBox(
                width: 96,
                height: 35,
                child: CustomButton(
                  title: "Sao chép",
                  bgColor: context.primaryColor,
                  onPressed: () {},
                  textStyle: context.textSize12
                      .copyWith(color: context.backgroundColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
