import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:tikop/models/RemoteConfig.dart';
// import 'package:tikop/shared_widgets/CircularIcon.dart';
// import 'package:tikop/shared_widgets/CustomShadow.dart';
// import 'package:tikop/shared_widgets/CustomShadowIcon.dart';
// import 'package:tikop/theme/app_color.dart';
// import 'package:tikop/utils/richtext_builder.dart';
// import 'package:tikop/utils/util.dart';
import 'package:trading_module/shared_widgets/CircularIcon.dart';
import 'package:trading_module/shared_widgets/CustomShadow.dart';
import 'package:trading_module/shared_widgets/CustomShadowIcon.dart';
import 'package:trading_module/shared_widgets/richtext_builder.dart';
import 'package:trading_module/theme/app_color.dart';
import 'package:trading_module/utils/util.dart';

class BankTypeComponent extends StatefulWidget {
  //final RemoteConfig config;
  final VoidCallback? onTapped;

  const BankTypeComponent({
    Key? key,
    //required this.config,
    this.onTapped,
  }) : super(key: key);

  @override
  _BankTypeComponentState createState() => _BankTypeComponentState();
}

class _BankTypeComponentState extends State<BankTypeComponent> {
  bool showDesc = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
            padding: PAD_ALL16,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => widget.onTapped?.call(),
              child: CustomShadow(
                child: Padding(
                  padding: PAD_ALL12,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/images/png/ic_bank2.png"),
                          Expanded(
                            child: Padding(
                              padding: PAD_SYM_H12,
                              child: Text(
                                 "",
                                style: context.textSize16.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: COLOR_NEUTRAL_500),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: context.primaryColor,
                            size: 36,
                          ),
                        ],
                      ),
                      SIZED_BOX_H16,
                      buildContent(
                          context,  ""),
                      SIZED_BOX_H12,
                      if (showDesc)
                        Column(
                          children: [
                            buildContent(context,
                                 ""),
                            SIZED_BOX_H12,
                            buildContent(context,
                                 ""),
                            SIZED_BOX_H12,
                          ],
                        ),
                      Row(
                        children: [
                          SvgPicture.asset("assets/images/svg/ic_tag.svg"),
                          SIZED_BOX_W06,
                          Text(
                            "Phí dịch vụ ",
                            style: context.textSize12
                                .copyWith(color: context.disabledColor),
                          ),
                          Text(
                            "0 VNĐ",
                            style: context.textSize12
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: CustomShadowWidget(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  setState(() {
                    showDesc = !showDesc;
                  });
                },
                child: CircularIcon(
                  radius: 26,
                  color: context.backgroundColor,
                  child: Center(
                    child: Icon(
                      showDesc
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: context.primaryColor,
                      size: 22.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildContent(BuildContext context, String content) {
    var modified = "@bstyle0@e*@bstyle1@e$content";
    modified = modified.replaceAll(RegExp('@begin'), "@bstyle2@e");
    modified = modified.replaceAll(RegExp('@end'), "@bstyle1@e");
    modified = modified.replaceAll(RegExp(r'\\n'), "\n");
    return RichTextBuilder(
      source: modified,
      styles: [
        context.textSize12.copyWith(color: Colors.red),
        context.textSize12.copyWith(
            fontWeight: FontWeight.normal, color: context.disabledColor),
        context.textSize12.copyWith(fontWeight: FontWeight.bold)
      ],
    );
  }
}
