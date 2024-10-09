import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

extension WidgetsSeparator on List<Widget> {
  List<Widget> withGapInBetween(double gapSize) {
    List<Widget> separatedList = <Widget>[];

    length > 0 ? separatedList.add(first) : null;

    map(
      (e) {
        if (_isNotFirstAndLastItem(e)) {
          separatedList.addAll([Gap(gapSize), e]);
        }
      },
    ).toList();

    return separatedList;
  }

  bool _isNotFirstAndLastItem(Widget e) => indexOf(e) > 0 && indexOf(e) < length;

  List<Widget> withDividerInBetween({
    Color? color,
    double? height,
    double? thickness,
    double? indent,
    double? endIndent,
  }) {
    List<Widget> separatedList = <Widget>[];

    length > 0 ? separatedList.add(first) : null;

    final divider = Divider(
      color: color,
      height: height,
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
    );

    map(
      (e) {
        if (_isNotFirstAndLastItem(e)) {
          separatedList.addAll([divider, e]);
        }
      },
    ).toList();

    return separatedList;
  }
}
