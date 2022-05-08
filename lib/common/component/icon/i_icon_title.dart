import 'package:flutter/material.dart';
import '../../../core/palette/palette.dart';
import '../../style/text_style/i_caption_style.dart';
import 'i_icon.dart';
import '../../../core/extensions/i_extensions.dart';

class IIconTitle extends StatelessWidget {
  final Widget child1;
  final Widget child2;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  const IIconTitle({
    Key? key,
    required this.child1,
    required this.child2,
    required this.mainAxisAlignment,
    required this.crossAxisAlignment,
  }) : super(key: key);

  factory IIconTitle.white(
      {required String icon, required title, double iconSize = 30}) {
    return IIconTitle(
      child1: IIcon(
        icon: icon,
        color: Palette.neutral10,
        size: iconSize,
      ),
      child2: Text(
        title,
        style: ICaption.regular(color: Palette.neutral10),
      ),
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
    );
  }

  factory IIconTitle.rounded(
      {required String icon,
      required title,
      double iconSize = 32,
      required Color color}) {
    return IIconTitle(
      child1: Builder(builder: (context) {
        return Container(
          margin: EdgeInsets.all(context.padding3),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              color,
              color.withOpacity(0.5),
              color.withOpacity(0.2),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: IIcon(
            icon: icon,
            color: color,
            size: iconSize,
          ),
        );
      }),
      child2: Text(
        title,
        style: ICaption.regular(color: Palette.neutral10),
      ),
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        child1,
        child2,
      ],
    );
  }
}
