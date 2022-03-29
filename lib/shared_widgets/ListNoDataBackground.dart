import 'package:flutter/material.dart';
import 'package:trading_module/utils/util.dart';

class ListNoDataBackground extends StatelessWidget {
  const ListNoDataBackground({
    required this.pngPath,
    this.desc,
    this.padding = EdgeInsets.zero,
    this.btnTitle,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final String pngPath;
  final String? desc;
  final EdgeInsets padding;

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
        if (desc != null)
          Text(
            desc!,
            style: context.textSize16.copyWith(
                fontWeight: FontWeight.normal, color: const Color(0xFF858585)),
            textAlign: TextAlign.center,
          ),
        SIZED_BOX_H12,
        GestureDetector(
          onTap: () {
            onPressed!();
          },
          child: Container(
            padding: const EdgeInsets.only(left: 20, top: 12, right: 20, bottom: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: const Color(0xFF27AE60),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset("assets/images/png/ic_add.png", package: "trading_module"),
                SIZED_BOX_W12,
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
