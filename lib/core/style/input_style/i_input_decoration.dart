import 'package:flutter/material.dart';

import '../../../core/palette/palette.dart';

class IInputDecoration extends InputDecoration {
  const IInputDecoration({
    required String? hintText,
    required Widget? suffixIcon,
    required InputBorder border,
    required InputBorder enableBorder,
    required Color fillColor,
  }) : super(
          hintText: hintText,
          suffixIcon: suffixIcon,
          border: border,
          focusedErrorBorder: border,
          disabledBorder: border,
          enabledBorder: enableBorder,
          errorBorder: border,
          focusedBorder: border,
          fillColor: fillColor,
    filled: true,
        );
  factory IInputDecoration.primary({
    required String? hintText,
    required Widget? suffixIcon,
    required Color fillColor,
  }) {
    return IInputDecoration(
      hintText: hintText,
      suffixIcon: suffixIcon,
      fillColor: fillColor,
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Palette.neutral50, width: 1),
        borderRadius: BorderRadius.circular(8.0),
      ),
      enableBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Palette.neutral50, width: 1),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
