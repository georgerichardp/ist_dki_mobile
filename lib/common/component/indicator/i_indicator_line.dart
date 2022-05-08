import 'package:flutter/material.dart';

import '../../../core/palette/palette.dart';

class IIndicatorLine extends StatelessWidget {
  final Widget indicator;
  const IIndicatorLine({Key? key, required this.indicator}) : super(key: key);

  factory IIndicatorLine.home() {
    return IIndicatorLine(
      indicator: Padding(
        padding: const EdgeInsets.only(top: 21, bottom: 8),
        child: Container(
          height: 5,
          width: 134,
          decoration: BoxDecoration(
              color: Palette.neutral100,
              borderRadius: BorderRadius.circular(100)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return indicator;
  }
}
