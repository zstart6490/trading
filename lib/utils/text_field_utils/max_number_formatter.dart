import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class MaxNumberInputFormatter extends TextInputFormatter {
  final int max;

  MaxNumberInputFormatter(this.max);
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }
    final intVal = int.tryParse(newValue.text) ?? 0;
    if (newValue.text.compareTo(oldValue.text) != 0 && intVal > max) {
      return oldValue;
    } else {
      final int selectionIndexFromTheRight =
          newValue.text.length - newValue.selection.extentOffset;
      final String newString = NumberFormat.decimalPattern("vi").format(intVal);
      return TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndexFromTheRight,
        ),
      );
    }
  }
}
