import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tikop/base/stateManagement/base_common_widget.dart';
import 'package:tikop/shared_widgets/CustomButton.dart';
import 'package:tikop/utils/enums.dart';
import 'package:tikop/utils/util.dart';

class TransferInfo extends StatelessWidget with BaseCommonWidgets {
  final Key? paymentContentKey;
  const TransferInfo({Key? key, required this.content, this.paymentContentKey})
      : super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: paymentContentKey,
      margin: PAD_ALL16,
      decoration: BoxDecoration(
        borderRadius: BOR_RAD8,
        color: context.scaffoldBackgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: "Nội dung chuyển khoản",
                            style: context.textSize14
                                .copyWith(color: context.disabledColor),
                            children: [
                              TextSpan(
                                  text: "*",
                                  style: context.textSize14
                                      .copyWith(color: context.errorColor))
                            ]),
                      ),
                      SIZED_BOX_H06,
                      Text(content, style: context.textSize14)
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
                                type: SnackBarType.success);
                          }
                        : null,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
