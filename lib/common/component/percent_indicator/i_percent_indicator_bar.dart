import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../core/palette/palette.dart';
import '../../style/text_style/i_caption_style.dart';

class PercentIndicatorBar extends StatelessWidget {
  final double? width;
  final double subTotal;
  final double total;
  final double lineHeight;
  final Color backgroundColor;
  final Color progressColor;
  final Widget? label;
  const PercentIndicatorBar({
    Key? key,
    required this.width,
    required this.subTotal,
    required this.total,
    required this.backgroundColor,
    required this.progressColor,
    required this.lineHeight,
    required this.label,
  }) : super(key: key);

  factory PercentIndicatorBar.primary({
    required double subTotal,
    required double total,
    required String label,
    double width = double.infinity,
  }) {
    return PercentIndicatorBar(
      subTotal: subTotal,
      total: total,
      backgroundColor: Palette.neutral40,
      progressColor: Palette.successMain,
      width: width,
      lineHeight: 8,
      label: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(label,style: ICaption.demi(),),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        label??const SizedBox(),
        SizedBox(
          width: width,
          height: lineHeight,
          child: LinearPercentIndicator(
            lineHeight: lineHeight,
            padding: const EdgeInsets.all(0),
            percent: subTotal / total,
            barRadius: const Radius.circular(8),
            backgroundColor: backgroundColor,
            progressColor: progressColor,
          ),
        ),
      ],
    );
  }
}
