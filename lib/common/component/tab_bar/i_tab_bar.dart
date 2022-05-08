import 'package:flutter/material.dart';

import '../../../core/palette/palette.dart';
import '../../style/text_style/i_title_style.dart';

class ITabBar extends StatelessWidget {
  final List<Widget> tabs;
  final TabController? controller;
  final Decoration? indicator;
  final EdgeInsetsGeometry? labelPadding;
  final EdgeInsetsGeometry indicatorPadding;
  final Color? labelColor;
  final Color? unselectedLabelColor;
  final TextStyle? labelStyle;
  final TextStyle? unselectedLabelStyle;
  final bool isScrollable;
  const ITabBar({
    Key? key,
    required this.tabs,
    required this.controller,
    required this.indicator,
    required this.labelPadding,
    required this.labelColor,
    required this.unselectedLabelColor,
    required this.labelStyle,
    required this.unselectedLabelStyle, required this.isScrollable, required this.indicatorPadding,
  }) : super(key: key);
  factory ITabBar.primary({required List<Widget> tabs, TabController? controller,bool isScrollable=false}) {
    return ITabBar(
      indicatorPadding: EdgeInsets.zero,
      controller: controller,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Palette.primary,
      ),
      isScrollable: isScrollable,
      labelPadding: const EdgeInsets.all(14),
      labelStyle: ITitle.smallDemi(),
      unselectedLabelStyle: ITitle.smallDemi(),
      labelColor: Palette.neutral10,
      unselectedLabelColor: Palette.neutral80,
      tabs: tabs,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Palette.neutral40,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TabBar(
        indicatorPadding: indicatorPadding,
        isScrollable: isScrollable,
        controller: controller,
        indicator: indicator,
        labelPadding: labelPadding,
        indicatorWeight: 4,
        labelStyle: labelStyle,
        unselectedLabelStyle: unselectedLabelStyle,
        labelColor: labelColor,
        unselectedLabelColor:unselectedLabelColor,
        tabs: tabs,
      ),
    );
  }
}
