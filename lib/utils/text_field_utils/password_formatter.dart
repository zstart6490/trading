import 'package:flutter/services.dart';
import 'package:trading_module/utils/convert_vietnam_char.dart';

class NoVietNameChartInputFormatter extends TextInputFormatter {
  NoVietNameChartInputFormatter();
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: ConvertVietnamCore.unsign(newValue.text),
      selection: newValue.selection,
    );
  }
}
