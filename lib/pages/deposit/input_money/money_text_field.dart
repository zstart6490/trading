import 'package:flutter/material.dart';
import 'package:trading_module/shared_widgets/CustomTextFormField.dart';
import 'package:trading_module/shared_widgets/MoneyTextField.dart';
import 'package:trading_module/utils/enums.dart';
import 'package:trading_module/utils/text_field_utils/numeric_formatter.dart';
import 'package:trading_module/utils/util.dart';

class MoneyInputComponent extends StatelessWidget {
  final InvestType? investType;
  final TextEditingController textEditingController;
  final FocusNode? focusNode;
  final Function(String) onChangeMoney;
  final TextStyle? textStyle;
  final int multipleOf;
  final bool? autoFocus;
  final ConditionState state;

  const MoneyInputComponent(
      {Key? key,
      required this.investType,
      required this.textEditingController,
      required this.onChangeMoney,
      required this.multipleOf,
      this.focusNode,
      this.autoFocus,
      this.textStyle, required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (investType == InvestType.property) {
      return MoneyTextField(
        hintText: "0",
        controller: textEditingController,
        autoFocus: autoFocus??true,
        maxLength: 6,
        focusNode: focusNode,
        textInputType: TextInputType.number,
        textStyle: context.textSize24,
        onChanged: (val) => onChangeMoney(val),
        multiple: multipleOf,
        formaters: [CurrencyInputFormatter()],
      );
    } else if (investType == InvestType.stock) {
      return MoneyTextField(
        hintText: "0",
        controller: textEditingController,
        autoFocus: autoFocus??true,
        maxLength: 9,
        focusNode: focusNode,
        textInputType: TextInputType.number,
        textStyle:context.textSize24,
        onChanged: (val) => onChangeMoney(val),
        multiple: multipleOf,
        suffixText: "CP",
        state: state,
        formaters: [CurrencyInputFormatter()],
      );
    } else {
      return CustomTextFormField(
        hintText: "0",
        controller: textEditingController,
        autoFocus: autoFocus??true,
        focusNode: focusNode,
        maxLength: 15,
        textInputType: TextInputType.number,
        textStyle: context.textSize24,
        onChanged: (val) => onChangeMoney(val),
        suffixText: "??",
        formaters: [CurrencyInputFormatter()],
        isCollapsed: true,
      );
    }
  }
}
