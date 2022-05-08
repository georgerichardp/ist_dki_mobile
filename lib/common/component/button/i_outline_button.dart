import 'package:flutter/material.dart';

import '../../../core/palette/palette.dart';
import '../../style/text_style/i_text_style.dart';
import '../icon/i_icon.dart';

class IOutlineButton extends OutlinedButton {
  const IOutlineButton(
      {Key? key,
      required VoidCallback? onPressed,
      required Widget child,
      required ButtonStyle style})
      : super(key: key, onPressed: onPressed, child: child, style: style);

  factory IOutlineButton.primary(
      {required VoidCallback? onPressed, required String title}) {
    return IOutlineButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: onPressed == null
            ? ITitle.largeDemi(color: Palette.neutral60)
            : ITitle.largeDemi(color: Palette.primary),
      ),
      style: OutlinedButton.styleFrom(),
    );
  }
  factory IOutlineButton.rounded(
      {required VoidCallback? onPressed, required String title}) {
    return IOutlineButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: onPressed == null
            ? ITitle.largeDemi(color: Palette.neutral60)
            : ITitle.largeDemi(color: Palette.primary),
      ),
      style: OutlinedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
    );
  }
  factory IOutlineButton.icon(
      {VoidCallback? onPressed, dynamic icon,Color color = Palette.primary}) {
    return IOutlineButton(
      onPressed: onPressed,
      child: Center(child: IIcon(icon: icon, size: 31,color: color,)),
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.zero,
        fixedSize: const Size(52,52),
      ),
    );
  }
}
