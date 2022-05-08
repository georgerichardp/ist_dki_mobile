import '../../style/text_style/i_text_style.dart';
import '../../../core/palette/palette.dart';
import 'package:flutter/material.dart';

class IButton extends ElevatedButton {
  const IButton(
      {Key? key,
      required VoidCallback? onPressed,
      required Widget? child,
      required ButtonStyle? style})
      : super(key: key, onPressed: onPressed, child: child, style: style);

  factory IButton.primary(
      {required VoidCallback? onPressed, required String title}) {
    return IButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: onPressed == null
            ? ITitle.largeDemi(color: Palette.neutral80)
            : ITitle.largeDemi(color: Palette.neutral10),
      ),
      style: ElevatedButton.styleFrom(),
    );
  }
  factory IButton.rounded(
      {required VoidCallback? onPressed, required String title}) {
    return IButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: onPressed == null
            ? ITitle.largeDemi(color: Palette.neutral80)
            : ITitle.largeDemi(color: Palette.neutral10),
      ),
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
    );
  }

  factory IButton.white(
      {required VoidCallback? onPressed, required String title}) {
    return IButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: onPressed == null
            ? ITitle.largeDemi(color: Palette.neutral60)
            : ITitle.largeDemi(color: Palette.primary),
      ),
      style: ElevatedButton.styleFrom(
        primary: Palette.neutral10,
      ),
    );
  }
}
