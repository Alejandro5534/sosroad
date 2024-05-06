import 'package:flutter/services.dart';

class NameInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final regex = RegExp('[^a-zA-Z0-9]');
    if (regex.hasMatch(newValue.text)) {
      return oldValue;
    }
    return newValue;
  }
}

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
  bool validateName(String name) {
    return name != '';
  }

  bool validateCellphone(String cellphone) {
    return cellphone.length == 10;
  }
}
