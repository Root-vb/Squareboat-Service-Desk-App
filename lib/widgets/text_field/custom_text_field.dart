import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/theme/app_colors.dart';
import 'package:starter/app/theme/styles.dart';
import 'package:starter/utils/helper/text_field_wrapper.dart';
import 'package:starter/widgets/upper_case_formatter.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextStyle hintStyle;
  final int? maxLength;
  final TextInputType inputType;
  final TextFieldWrapper wrapper;
  final bool isEnabled;
  Function()? onSubmitted;

  CustomTextField({
    required this.wrapper,
    required this.hintText,
    required this.hintStyle,
    this.maxLength,
    this.inputType = TextInputType.text,
    this.isEnabled = true,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextField(
        controller: wrapper.controller,
        style: Styles.tsPrimaryColorRegular14,
        maxLength: maxLength,
        keyboardType: inputType,
        inputFormatters: [UpperCaseTextFormatter()],
        onSubmitted: (_) => onSubmitted,
        enabled: isEnabled,
        decoration: InputDecoration(
          errorText: wrapper.errorText.isEmpty ? null : wrapper.errorText,
          errorStyle: Styles.tsPrimaryColorRegular18,
          counterText: '',
          fillColor: AppColors.white,
          filled: true,
          hintText: hintText,
          hintStyle: hintStyle,
          enabled: isEnabled,
          isDense: true,
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff595C97),
              width: 0.1,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff595C97),
              width: 0.1,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.1,
              color: Color(0xff595C97),
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff595C97),
              width: 0.1,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
