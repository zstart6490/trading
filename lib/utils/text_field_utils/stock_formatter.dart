import 'package:flutter/services.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:intl/intl.dart';

class StockFormatter extends TextInputFormatter {
  final int maxAmount;
  final Function? onOver;
  final int? multipleOf;
  StockFormatter({
    this.maxAmount = -1,
    this.multipleOf = 1,
    this.onOver,
  });
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    if (newValue.text.compareTo(oldValue.text) != 0) {
      final int selectionIndexFromTheRight =
          newValue.text.length - newValue.selection.extentOffset;

      final intVal = int.tryParse(newValue.text.numericOnly()) ?? 0;
      if (maxAmount > 0 && (intVal * multipleOf!) > maxAmount) {
        onOver?.call();
        return oldValue;
      }
      final String newString = NumberFormat.decimalPattern("vi").format(intVal);
      return TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndexFromTheRight,
        ),
      );
    } else {
      return newValue;
    }
  }
}
