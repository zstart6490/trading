import 'package:flutter/material.dart';
import 'package:trading_project/configs/constants.dart';
import 'package:trading_project/theme/app_color.dart';

class CustomButton extends StatelessWidget {
  final Color? bgColor;
  final double? borderRadius;
  final VoidCallback? onPressed;

  final TextStyle? textStyle;
  final String? title;
  final Widget? child;
  final double? height;
  final double? width;
  const CustomButton({
    Key? key,
    this.bgColor,
    this.onPressed,
    this.borderRadius = 8.0,
    this.child,
    this.textStyle,
    this.title,
    this.height = 52.0,
    this.width,
  }) : super(key: key);

  factory CustomButton.iconStyle({
    required Widget icon,
    String? title,
    TextStyle? textStyle,
    required VoidCallback? onPressed,
  }) {
    final Widget child =
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      icon,
      if (title != null) SIZED_BOX_W06,
      if (title != null)
        Text(
          title,
          maxLines: 1,
          textScaleFactor: 1,
          style: textStyle ??
              const TextStyle(
                color: BACKGROUND_COLOR_L,
                fontFamily: 'iCielHelveticaNowText',
                fontStyle: FontStyle.normal,
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
              ),
        ),
    ]);
    return CustomButton(
      onPressed: onPressed,
      child: child,
    );
  }

  factory CustomButton.defaultStyle({
    required String title,
    required VoidCallback? onPressed,
  }) {
    return CustomButton(
      title: title,
      onPressed: onPressed,
    );
  }

  factory CustomButton.trailingStyle({
    required String title,
    required TextStyle textStyle,
    required VoidCallback? onPressed,
    required Widget trailing,
  }) {
    final child = SizedBox(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(title, textScaleFactor: 1, style: textStyle),
            Positioned(
              right: 8,
              child: trailing,
            )
          ],
        ));
    return CustomButton(
      title: title,
      onPressed: onPressed,
      child: child,
    );
  }
  factory CustomButton.smallButton({
    required String title,
    required VoidCallback? onPressed,
    double? width,
  }) {
    final child = SizedBox(
      child: Padding(
        padding: PAD_SYM_V12,
        child: Center(child: Text(title, textScaleFactor: 1)),
      ),
    );
    return CustomButton(
      title: title,
      onPressed: onPressed,
      height: null,
      width: width ?? 148,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width ?? double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius!)),
          primary: bgColor ?? Theme.of(context).primaryColor,
          elevation: 0,
        ),
        onPressed: onPressed,
        child: child ??
            Text(title!,
                textScaleFactor: 1,
                style: textStyle ?? Theme.of(context).textTheme.headline4),
      ),
    );
  }
}
