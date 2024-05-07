import 'package:flutter/services.dart';

class CellphoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final regex = RegExp('[^0-9]');
    if (regex.hasMatch(newValue.text)) {
      return oldValue;
    }
    return newValue;
  }
}

mixin Validators {
  String? validateCellphone(String cellphone) {
    return cellphone != '' && cellphone.length == 10
        ? null
        : 'Cellphone must be at least 10 characters long';
  }
}
