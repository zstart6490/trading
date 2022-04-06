import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/utils/extensions.dart';


 class StFailTransactionState extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    final fontStyle =
        context.textSize14.copyWith(color: Colors.red, fontWeight: FontWeight.w500);
    return Column(
      children: [
        SvgPicture.asset("assets/images/svg/ic_saving_success.svg"),
        SIZED_BOX_H16,
        Text("Lệnh mua thất bại", style: fontStyle),
      ],
    );
  }

}
