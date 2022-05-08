import 'package:flutter/material.dart';

import '../../../core/palette/palette.dart';
import '../../core/style/text_style/i_title_style.dart';

class IAppBar extends AppBar {
  IAppBar({
    required Key? key,
    required List<Widget>? actions,
    required Widget? title,
    required bool? centerTitle,
    required PreferredSizeWidget? bottom,
    required Color? backgroundColor,
  }) : super(
          key: key,
          actions: actions,
          title: title,
          centerTitle: centerTitle,
          backgroundColor: backgroundColor,
        );

  ///ini app bar dengan title nya di tengah
  factory IAppBar.center(
      {Key? key, List<Widget>? actions, required String title}) {
    return IAppBar(
      backgroundColor: null,
      key: key,
      actions: actions,
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      centerTitle: true,
      bottom: null,
    );
  }
  factory IAppBar.none({Key? key}) {
    return IAppBar(
      key: key,
      actions: null,
      title: null,
      centerTitle: true,
      bottom: null,
      backgroundColor: Palette.neutral100,
    );
  }
  ///ini app bar dengan title nya di bawah
  factory IAppBar.bottom(
      {Key? key, List<Widget>? actions, required String title}) {
    return IAppBar(
      backgroundColor: null,
      key: key,
      actions: actions,
      title: null,
      centerTitle: true,
      bottom: PreferredSize(
          child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  title,
                  style: ITitle.xlMedium(),
                ),
              )),
          preferredSize: const Size(double.infinity, 21)),
    );
  }
}
