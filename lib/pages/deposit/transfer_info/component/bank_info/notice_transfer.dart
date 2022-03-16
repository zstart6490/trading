import 'package:flutter/material.dart';
// import 'package:tikop/theme/app_color.dart';
// import 'package:tikop/utils/util.dart';

import 'package:trading_module/theme/app_color.dart';
import 'package:trading_module/utils/util.dart';

class NoticeTransfer extends StatelessWidget {
  const NoticeTransfer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PAD_SYM_H16,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "*",
                    style: context.textSize12.copyWith(color: ERROR_COLOR_L),
                  ),
                  TextSpan(
                    text:
                        "Lưu ý: Thiếu nội dung chuyển khoản Tikop sẽ không thể nhận ra khoản tiền đến từ bạn",
                    style:
                        context.textSize12.copyWith(color: COLOR_NEUTRAL_300),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
