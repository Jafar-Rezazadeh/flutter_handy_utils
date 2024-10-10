import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

/// [WidgetsSeparator]Extension on List<Widget> to separate widgets with a gap or divider.
extension WidgetsSeparator on List<Widget> {
  /// [withGapInBetween] Returns a new list with gaps of the specified size between each widget.
  ///
  /// If the list is empty, an empty list is returned.
  ///
  /// Example:
  /// ```dart
  /// List<Widget> widgets = [Widget1(), Widget2(), Widget3()];
  /// List<Widget> separatedWidgets = widgets.withGapInBetween(10.0);
  /// ```
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

  bool _isNotFirstAndLastItem(Widget e) =>
      indexOf(e) > 0 && indexOf(e) < length;

  /// [withDividerInBetween] Returns a new list with dividers between each widget.
  ///
  /// The divider's color, height, thickness, indent, and endIndent can be customized.
  ///
  /// If the list is empty, an empty list is returned.
  ///
  /// Example:
  /// ```dart
  /// List<Widget> widgets = [Widget1(), Widget2(), Widget3()];
  /// List<Widget> separatedWidgets = widgets.withDividerInBetween(
  ///   color: Colors.grey,
  ///   height: 1.0,
  ///   thickness: 1.0,
  ///   indent: 10.0,
  ///   endIndent: 10.0,
  /// );
  /// ```
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
