import 'package:flutter/material.dart';

import '../../../core/palette/palette.dart';

class ICaption extends TextStyle {
  const ICaption({
    required double fontSize,
    required FontStyle fontStyle,
    required FontWeight fontWeight,
    required Color color,
  }) : super(
          fontSize: fontSize,
          fontStyle: fontStyle,
          fontWeight: fontWeight,
          color: color,
        );
  factory ICaption.bold({Color? color}) {
    return ICaption(
      fontSize: 12,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      color: color??Palette.titleBlack,
    );
  }
  factory ICaption.demi({Color? color}) {
    return ICaption(
      fontSize: 12,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      color: color??Palette.titleBlack,
    );
  }
  factory ICaption.medium({Color? color}) {
    return ICaption(
      fontSize: 12,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      color: color??Palette.titleBlack,
    );
  }
  factory ICaption.regular({Color? color}) {
    return ICaption(
      fontSize: 12,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      color: color??Palette.titleBlack,
    );
  }
}
