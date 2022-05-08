// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../common/style/text_style/i_text_style.dart';
import '../palette/palette.dart';

class ITheme {
  ThemeData createTheme() {
    return ThemeData(
      disabledColor: Colors.grey,
      colorScheme: const ColorScheme(
        primary: Palette.primary,
        primaryVariant: Palette.primary,
        surface: Palette.infoSurface,
        background: Colors.white,
        error: Palette.dangerMain,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Palette.infoSurface,
        onBackground: Palette.neutral10,
        onError: Palette.dangerSurface,
        brightness: Brightness.light,
        secondary: Palette.neutral20,
      ),

      brightness: Brightness.light,
      primaryColor: Palette.primary,
      splashColor: Palette.primary,
      scaffoldBackgroundColor: Palette.neutral10,
      dividerTheme: const DividerThemeData(thickness: 1),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Palette.neutral10,
        titleTextStyle: ITitle.largeDemi(),
        iconTheme: const IconThemeData(
          color: Palette.neutral100,
          size: 27,
        ),

      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
                elevation: 0,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                fixedSize: const Size(double.infinity, 52))
            .copyWith(
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) => states.contains(MaterialState.disabled)
                ? Palette.neutral40
                : Palette.primary,
          ),
          textStyle: MaterialStateProperty.all(ITitle.largeDemi(color: Colors.red))
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 32),
          fixedSize: const Size(double.infinity, 52),
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
        ).copyWith(
            foregroundColor: MaterialStateProperty.resolveWith(
              (states) => states.contains(MaterialState.disabled)
                  ? Colors.grey
                  : Palette.primary,
            ),
            side: MaterialStateProperty.resolveWith(
              (states) => states.contains(MaterialState.disabled)
                  ? const BorderSide(
                      color: Colors.grey,
                width: 1,
                    )
                  : const BorderSide(
                      color: Palette.primary,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
            ),)
      ),
    );
  }
}
