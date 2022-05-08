import 'package:flutter/cupertino.dart';

import '../../../core/palette/palette.dart';

class IBody extends TextStyle {
  const IBody({
    required double fontSize,
    required FontStyle fontStyle,
    required FontWeight fontWeight,
    required double letterSpacing,
    required Color color,
  }) : super(
          fontSize: fontSize,
          fontStyle: fontStyle,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          color: color,
        );
  factory IBody.medium({Color? color}) {
    return IBody(
      fontSize: 16,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      letterSpacing: -0.011,
      color: color ?? Palette.titleBlack,
    );
  }
  factory IBody.regular({Color? color}) {
    return IBody(
      fontSize: 16,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.014,
      color: color ?? Palette.titleBlack,
    );
  }
  factory IBody.small({Color? color}) {
    return IBody(
      fontSize: 14,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.006,
      color: color ?? Palette.titleBlack,
    );
  }
}
