import 'package:flutter/material.dart';

import '../../../core/palette/palette.dart';
import '../../style/text_style/i_text_style.dart';

class IFlatButton extends TextButton {
  const IFlatButton(
      {Key? key, required VoidCallback? onPressed, required Widget child})
      : super(key: key, onPressed: onPressed, child: child);

  factory IFlatButton.primary(
      {required VoidCallback? onPressed, required String title}) {
    return IFlatButton(
      onPressed: onPressed,
      child: Text(
        title,
      ),
    );
  }
  factory IFlatButton.white(
      {required VoidCallback? onPressed, required String title}) {
    return IFlatButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: ITitle.smallDemi(color: Palette.neutral10),
      ),
    );
  }
}
