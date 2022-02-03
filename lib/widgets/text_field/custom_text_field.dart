import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/theme/app_colors.dart';
import 'package:starter/app/theme/styles.dart';
import 'package:starter/utils/helper/text_field_wrapper.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextStyle hintStyle;
  final int? maxLength;
  final TextInputType inputType;
  final TextFieldWrapper wrapper;
  final bool isEnabled;
  final Color fillColor;
  Function()? onSubmitted;
  final TextInputAction textInputAction;
  bool readOnly;
  int? maxLines;

  CustomTextField({
    required this.wrapper,
    required this.hintText,
    required this.hintStyle,
    this.maxLength,
    this.inputType = TextInputType.text,
    this.isEnabled = true,
    this.onSubmitted,
    required this.textInputAction,
    required this.fillColor,
    this.readOnly = false,
    // this.inputformator,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextField(
        readOnly: readOnly,
        controller: wrapper.controller,
        style: Styles.tsPrimaryColorRegular14,
        maxLength: maxLength,
        maxLines: maxLines,
        keyboardType: inputType,
        // inputFormatters: inputformator,
        onSubmitted: (_) => onSubmitted,
        enabled: isEnabled,

        textInputAction: textInputAction,
        decoration: InputDecoration(
          errorText: wrapper.errorText.isEmpty ? null : wrapper.errorText,
          errorStyle: Styles.tsRedRegular14,
          fillColor: fillColor,
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
