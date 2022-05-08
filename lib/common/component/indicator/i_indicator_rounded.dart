import 'package:flutter/material.dart';

import '../../../core/palette/palette.dart';

enum IIndicatorTypePin { none, failed, success }

class IIndicatorRounded extends StatelessWidget {
  final Widget indicator;
  const IIndicatorRounded({Key? key, required this.indicator})
      : super(key: key);
  factory IIndicatorRounded.swiper({bool active = false}) {
    return IIndicatorRounded(
        indicator: Container(
      height: 8,
      width: 8,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:
              active ? Palette.neutral10 : Palette.neutral10.withOpacity(0.5)),
    ));
  }
  factory IIndicatorRounded.pin(
      {IIndicatorTypePin indicatorTypePin = IIndicatorTypePin.none}) {
    return IIndicatorRounded(
        indicator: indicatorTypePin == IIndicatorTypePin.failed
            ? Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  color: Palette.dangerMain,
                  shape: BoxShape.circle,
                  border: Border.all(color: Palette.dangerSurface, width: 8),
                ),
              )
            : indicatorTypePin == IIndicatorTypePin.success
                ? Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      color: Palette.successMain,
                      shape: BoxShape.circle,
                      border:
                          Border.all(color: Palette.successSurface, width: 8),
                    ),
                  )
                : SizedBox(
                    height: 32,
                    width: 32,
                    child: Center(
                      child: Container(
                        height: 16,
                        width: 16,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: Palette.neutral50, width: 2),
                        ),
                      ),
                    ),
                  ));
  }
  @override
  Widget build(BuildContext context) {
    return indicator;
  }
}
