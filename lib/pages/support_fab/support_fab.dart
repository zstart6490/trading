import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:trading_module/pages/support_fab/support_controller.dart';
import 'package:trading_module/shared_widgets/CustomFAB.dart';
import 'package:trading_module/utils/util.dart';

class SupportFAB extends StatelessWidget {
  const SupportFAB(
      {Key? key,
      this.hasBottomBar = false,
      this.shouldShowFull = true,
      this.padBot = 0})
      : super(key: key);
  final bool hasBottomBar;
  final bool shouldShowFull;
  final double padBot;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SupportController>(
        init: SupportController(),
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.only(bottom: padBot),
            child: CustomFAB(
              hasBottomBar: hasBottomBar,
              children: [
                MenuItem(
                    label: "Messenger",
                    labelStyle: context.textSize16.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w500),
                    child: Image.asset(
                      "assets/images/png/ic_messenger.png",
                      width: 32,
                      height: 32,
                      fit: BoxFit.contain,
                    ),
                    onTap: () => controller.openMessenger()),
                MenuItem(
                    label: "Zalo",
                    labelStyle: context.textSize16.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w500),
                    child: Image.asset(
                      "assets/images/png/ic_zalo.png",
                      width: 32,
                      height: 32,
                      fit: BoxFit.contain,
                    ),
                    onTap: () => controller.openZalo()),
                // if (shouldShowFull)
                //   MenuItem(
                //       label: "Telegram",
                //       labelStyle: context.textSize16.copyWith(
                //           color: Colors.white, fontWeight: FontWeight.w500),
                //       child: Image.asset(
                //         "assets/images/png/ic_telegram.png",
                //         width: 32,
                //         height: 32,
                //         fit: BoxFit.contain,
                //       ),
                //       onTap: () => controller.openTelegram()),
                MenuItem(
                    label: "Hotline",
                    labelStyle: context.textSize16.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w500),
                    child: Image.asset(
                      "assets/images/png/ic_phone.png",
                      width: 32,
                      height: 32,
                      fit: BoxFit.contain,
                    ),
                    onTap: () => controller.openHotline()),
                if (shouldShowFull)
                  MenuItem(
                      label: "Email",
                      labelStyle: context.textSize16.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w500),
                      child: Image.asset(
                        "assets/images/png/ic_email.png",
                        width: 32,
                        height: 32,
                        fit: BoxFit.contain,
                      ),
                      onTap: () => controller.openEmail()),
                if (shouldShowFull)
                  MenuItem(
                      label: "Góp ý",
                      labelStyle: context.textSize16.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w500),
                      child: Image.asset(
                        "assets/images/png/ic_feedback.png",
                        width: 32,
                        height: 32,
                        fit: BoxFit.contain,
                      ),
                      onTap: () => controller.openFeedback()),
              ],
            ),
          );
        });
  }
}
