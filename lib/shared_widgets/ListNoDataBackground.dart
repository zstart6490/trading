import 'package:flutter/material.dart';
import 'package:trading_module/utils/util.dart';

class ListNoDataBackground extends StatelessWidget {
  const ListNoDataBackground({
    required this.pngPath,
    this.title,
    this.desc,
    this.padding = EdgeInsets.zero,
    this.btnTitle,
    this.showIconButton = true,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final String pngPath;
  final String? title;
  final String? desc;
  final EdgeInsets padding;
  final bool showIconButton;

  final String? btnTitle;
  final VoidCallback? onPressed;

  factory ListNoDataBackground.png(String path,
      {String? desc, EdgeInsets padding = EdgeInsets.zero}) {
    return ListNoDataBackground(
      pngPath: path,
      desc: desc,
      padding: padding,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: padding,
          child: Image.asset(pngPath, package: "trading_module"),
        ),
        SIZED_BOX_H12,
        if (title != null)
          Text(
            title!,
            style: context.textSize16.copyWith(
                fontWeight: FontWeight.bold, color: const Color(0xFF333333)),
            textAlign: TextAlign.center,
          ),
        SIZED_BOX_H12,
        if (desc != null)
          Text(
            desc!,
            style: context.textSize14.copyWith(
                fontWeight: FontWeight.normal, color: const Color(0xFF5C5C5C)),
            textAlign: TextAlign.center,
          ),
        SIZED_BOX_H12,
        if (btnTitle != null)
          GestureDetector(
            onTap: () {
              onPressed!();
            },
            child: Container(
              padding: const EdgeInsets.only(
                  left: 20, top: 10, right: 20, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: const Color(0xFF27AE60),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (showIconButton)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset("assets/images/png/ic_add.png",
                            package: "trading_module"),
                        SIZED_BOX_W12,
                      ],
                    ),
                  Text(
                    btnTitle ?? "",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'iCielHelveticaNowText',
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.none,
                    ),
                  )
                ],
              ),
            ),
          ),
      ],
    );
  }
}
