import 'package:flutter/material.dart';

import '../../../core/palette/palette.dart';
import '../../style/text_style/i_text_style.dart';

class ITextTile2Row extends StatelessWidget {
  final Widget child1;
  final Widget child2;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  const ITextTile2Row({
    Key? key,
    required this.child1,
    required this.child2,
    required this.mainAxisAlignment,
    required this.crossAxisAlignment,
    required this.mainAxisSize,
  }) : super(key: key);

  factory ITextTile2Row.seeAll({
    required String title,
    required VoidCallback onSeeAll
  }) {
    return ITextTile2Row(
      child1: Text(
        title,
        style: ITitle.smallDemi(),
      ),
      child2: InkWell(
        onTap: onSeeAll,
        child: Text(
          "Lihat Semua",
          style: ICaption.regular(color: Palette.primary),
        ),
      ),
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      children: [child1, child2],
    );
  }
}
