import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:tikop/models/Bank.dart';
// import 'package:tikop/modules/deposit/transfer_info/component/bank_info/frame_content_overlay.dart';
// import 'package:tikop/shared_widgets/BankIcon.dart';
// import 'package:tikop/theme/app_color.dart';
// import 'package:tikop/utils/util.dart';
import 'package:trading_module/data/entities/naptien/Bank.dart';
import 'package:trading_module/pages/deposit/transfer_info/component/bank_info/frame_content_overlay.dart';
import 'package:trading_module/shared_widgets/BankIcon.dart';
import 'package:trading_module/theme/app_color.dart';
import 'package:trading_module/utils/util.dart';

class ViewChoiceBank extends StatelessWidget {
  final Function() onContinue;

  final OurBank bank;
  const ViewChoiceBank({Key? key, required this.onContinue, required this.bank})
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
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                    color: COLOR_WHITE, shape: BoxShape.circle),
                child: Column(
                  children: [
                    SIZED_BOX_H20,
                    BankIcon(
                      bankIcon: bank.imageUrl,
                      bankName: bank.code,
                      isSelected: true,
                    ),
                  ],
                ),
              ),
              SIZED_BOX_H12,
              SvgPicture.asset("assets/images/svg/ic_polygon.svg"),
            ],
          ),
          FrameContent(
            onContinue: onContinue,
            title: 'Chọn ngân hàng của Tikop',
            detail:
                'Vui lòng chọn một trong những ngân hàng của Tikop để thực hiện chuyển khoản',
            iconWidget:
                SvgPicture.asset("assets/images/svg/ic_bank_second.svg"),
          ),
        ],
      ),
    );
  }
}
