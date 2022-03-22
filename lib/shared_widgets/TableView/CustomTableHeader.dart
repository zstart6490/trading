import 'package:flutter/material.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/utils/extensions.dart';

class CustomTableHeader extends StatelessWidget {
  const CustomTableHeader({
    Key? key,
    required this.title,
    this.bgColor,
  }) : super(key: key);
  final String title;
  final Color? bgColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
          color: bgColor ?? context.primaryColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0))),
      height: 44,
      width: double.infinity,
      child: Row(
        children: [
          Padding(
            padding: PAD_SYM_H12,
            child: Text(
              title,
              style: context.textSize16.copyWith(
                  color: context.backgroundColor, fontWeight: FontWeight.w500),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTableHeaderWithTrailing extends StatelessWidget {
  const CustomTableHeaderWithTrailing({
    Key? key,
    required this.title,
    required this.trailing,
    this.bgColor,
  }) : super(key: key);
  final Widget trailing;
  final String title;
  final Color? bgColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: bgColor ?? context.primaryColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0))),
      height: 48,
      width: double.infinity,
      child: Padding(
        padding: PAD_SYM_H16,
        child: Row(
          children: [
            Text(
              title,
              style:
                  context.textSize16.copyWith(color: context.backgroundColor),
              textAlign: TextAlign.left,
            ),
            const Spacer(),
            trailing,
          ],
        ),
      ),
    );
  }
}
