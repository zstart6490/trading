import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trading_project/configs/constants.dart';
import 'package:trading_project/utils/enums.dart';
import 'package:trading_project/utils/extensions.dart';

class ValidateComponent extends StatelessWidget {
  const ValidateComponent({
    Key? key,
    this.state = ConditionState.none,
    required this.desc,
    this.fixedDescColor,
  }) : super(key: key);
  final ConditionState state;
  final String desc;
  final Color? fixedDescColor;

  @override
  Widget build(BuildContext context) {
    Color color;
    Widget icon;
    switch (state) {
      case ConditionState.none:
        color = fixedDescColor ?? context.disabledColor;
        icon = SvgPicture.asset(
          "assets/images/svg/ic_condition_none.svg",
          width: 18,
          height: 18,
        );
        break;
      case ConditionState.success:
        color = fixedDescColor ?? context.primaryColor;
        icon = SvgPicture.asset(
          "assets/images/svg/ic_condition_success.svg",
          width: 18,
          height: 18,
        );
        break;
      case ConditionState.error:
        color = fixedDescColor ?? context.errorColor;
        icon = SvgPicture.asset(
          "assets/images/svg/ic_condition_error.svg",
          width: 18,
          height: 18,
        );
        break;
      case ConditionState.info:
        color = fixedDescColor ?? Colors.blue;
        icon = SvgPicture.asset(
          "assets/images/svg/ic_condition_info.svg",
          width: 18,
          height: 18,
        );
        break;
      case ConditionState.warning:
        color = const Color(0xFFFF821E);
        icon = SvgPicture.asset(
          "assets/images/svg/ic_condition_warning.svg",
          width: 18,
          height: 18,
        );
        break;
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        icon,
        SIZED_BOX_W06,
        Expanded(
          child: AutoSizeText(
            desc,
            maxLines: 2,
            style: context.textSize14.copyWith(color: color),
          ),
        ),
      ],
    );
  }
}

class ValidateEKYCComponent extends StatelessWidget {
  const ValidateEKYCComponent({
    Key? key,
    this.state = ConditionState.none,
    required this.desc,
  }) : super(key: key);
  final ConditionState state;
  final String desc;

  @override
  Widget build(BuildContext context) {
    Color color;
    Widget icon;
    switch (state) {
      case ConditionState.none:
        color = context.primaryColor;
        icon = Container();
        break;
      case ConditionState.success:
        color = context.primaryColor;
        icon = SvgPicture.asset(
          "assets/images/svg/ic_condition_success.svg",
          width: 18,
          height: 18,
        );
        break;
      case ConditionState.error:
        color = context.errorColor;
        icon = SvgPicture.asset(
          "assets/images/svg/ic_condition_error.svg",
          width: 18,
          height: 18,
        );
        break;
      case ConditionState.info:
        color = Colors.blue;
        icon = SvgPicture.asset(
          "assets/images/svg/ic_condition_info.svg",
          width: 18,
          height: 18,
        );
        break;
      case ConditionState.warning:
        color = const Color(0xFFFF821E);
        icon = SvgPicture.asset(
          "assets/images/svg/ic_condition_warning.svg",
          width: 18,
          height: 18,
        );
        break;
    }
    return LayoutBuilder(
      builder: (context, constraints) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(width: 6),
          Container(
            constraints:
                BoxConstraints(maxWidth: constraints.maxWidth - 6 - 18),
            child: AutoSizeText(
              desc,
              maxLines: 2,
              minFontSize: 10,
              textAlign: TextAlign.center,
              style: context.textSize14.copyWith(color: color),
            ),
          ),
        ],
      ),
    );
  }
}

class ValidateReferralComponent extends StatelessWidget {
  const ValidateReferralComponent({
    Key? key,
    this.state = ConditionState.none,
    required this.normalString,
    required this.boldString,
  }) : super(key: key);
  final ConditionState state;
  final String normalString;
  final String boldString;

  @override
  Widget build(BuildContext context) {
    Color color;
    Widget icon;
    switch (state) {
      case ConditionState.info:
      case ConditionState.none:
        return const SizedBox();
      case ConditionState.success:
        color = const Color(0xFF2F80ED);
        icon = SvgPicture.asset(
          "assets/images/svg/ic_condition_info.svg",
          width: 18,
          height: 18,
        );
        break;
      case ConditionState.error:
        color = context.errorColor;
        icon = SvgPicture.asset(
          "assets/images/svg/ic_condition_error.svg",
          width: 18,
          height: 18,
        );
        break;

      case ConditionState.warning:
        color = const Color(0xFFFF821E);
        icon = SvgPicture.asset(
          "assets/images/svg/ic_condition_warning.svg",
          width: 18,
          height: 18,
        );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        icon,
        SIZED_BOX_W06,
        Expanded(
          child: RichText(
            text: TextSpan(
              text: normalString,
              style: context.textSize12.copyWith(color: color),
              children: [
                TextSpan(
                  text: boldString,
                  style: context.textSize12
                      .copyWith(color: color, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
