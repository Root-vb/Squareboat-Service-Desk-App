import 'package:flutter/services.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.capitalizeFirst ?? "",
      selection: newValue.selection,
    );
  }
}
