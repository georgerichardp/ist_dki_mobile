import '../../../core/palette/palette.dart';
import 'package:flutter/material.dart';

class ITitle extends TextStyle {
  const ITitle({
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
  factory ITitle.xlBold({Color? color}) {
    return ITitle(
      fontSize: 24,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.019,
      color: color ?? Palette.titleBlack,
    );
  }
  factory ITitle.xlMedium({Color? color}) {
    return ITitle(
      fontSize: 24,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      letterSpacing: -0.019,
      color: color ?? Palette.titleBlack,
    );
  }
  factory ITitle.largeBold({Color? color}) {
    return ITitle(
      fontSize: 20,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.017,
      color: color ?? Palette.titleBlack,
    );
  }
  factory ITitle.largeDemi({Color? color}) {
    return ITitle(
      fontSize: 20,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.017,
      color: color ?? Palette.titleBlack,
    );
  }
  factory ITitle.largeMedium({Color? color}) {
    return ITitle(
      fontSize: 20,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      letterSpacing: -0.017,
      color: color ?? Palette.titleBlack,
    );
  }
  factory ITitle.mediumBold({Color? color}) {
    return ITitle(
      fontSize: 18,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.017,
      color: color ?? Palette.titleBlack,
    );
  }
  factory ITitle.mediumDemi({Color? color}) {
    return ITitle(
      fontSize: 18,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      letterSpacing: -0.017,
      color: color ?? Palette.titleBlack,
    );
  }
  factory ITitle.smallBold({Color? color}) {
    return ITitle(
      fontSize: 18,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.011,
      color: color ?? Palette.titleBlack,
    );
  }
  factory ITitle.smallDemi({Color? color}) {
    return ITitle(
      fontSize: 18,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.011,
      color: color ?? Palette.titleBlack,
    );
  }
  factory ITitle.tinyBold({Color? color}) {
    return ITitle(
      fontSize: 14,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.014,
      color: color ?? Palette.titleBlack,
    );
  }
  factory ITitle.tinyDemi({Color? color}) {
    return ITitle(
      fontSize: 14,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.014,
      color: color ?? Palette.titleBlack,
    );
  }
}
