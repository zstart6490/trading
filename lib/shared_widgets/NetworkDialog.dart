import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/shared_widgets/CustomButton.dart';
import 'package:trading_module/utils/extensions.dart';

class NetworkDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: PAD_SYM_H30,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 320),
          decoration: BoxDecoration(
              borderRadius: BOR_RAD8, color: context.backgroundColor),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) =>
                Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(28.0, 28.0, 28.0, 0),
                  child: Image.asset("assets/images/png/ic_internet_popup.png"),
                ),
                Padding(
                  padding: PAD_BOTTOM_16,
                  child: Text(
                    "Kết nối Internet không ổn định",
                    style: context.textSize16,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: PAD_SYM_H16,
                  child: Text(
                    "Quý khách vui lòng kiểm tra lại kết nối wifi hoặc mạng di động",
                    style: context.textSize14,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                    padding: PAD_ALL16,
                    child: CustomButton.defaultStyle(
                      title: "Xác nhận",
                      onPressed: () {
                        Get.back();
                      },
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
