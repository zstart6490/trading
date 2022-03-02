import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/utils/extensions.dart';

class PinCode extends StatelessWidget {
  const PinCode({
    Key? key,
    this.activeColor,
    this.textEditingController,
    this.autoFocus = true,
    this.focusNode,
    required this.onChanged,
    this.length = 4,
  }) : super(key: key);
  final int length;
  final Color? activeColor;
  final bool autoFocus;
  final FocusNode? focusNode;
  final TextEditingController? textEditingController;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      length: length,
      appContext: context,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BOR_RAD8,
        fieldHeight: 16,
        fieldWidth: 16,
        borderWidth: 8,
        selectedColor: BOR_COLOR,
        inactiveColor: BOR_COLOR,
        activeColor: activeColor ?? context.primaryColor,
      ),
      autoFocus: autoFocus,
      focusNode: focusNode,
      onChanged: (pin) => onChanged(pin),
      controller: textEditingController,
      cursorColor: context.primaryColor,
      textStyle: context.textSize14,
      keyboardType: TextInputType.number,
    );
  }
}
