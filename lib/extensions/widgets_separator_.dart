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

    for (var i = 0; i < length; i++) {
      separatedList.add(this[i]);
      ifNotLast(i) ? separatedList.add(Gap(gapSize)) : null;
    }

    return separatedList;
  }

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
    final divider = Divider(
      color: color,
      height: height,
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
    );

    for (var i = 0; i < length; i++) {
      separatedList.add(this[i]);
      ifNotLast(i) ? separatedList.add(divider) : null;
    }

    return separatedList;
  }

  /// [withWidgetInBetween] Returns a new list with the given widget inserted between each element of the original list.
  ///
  /// The [widget] parameter specifies the widget to insert between each item.
  ///
  /// If the list is empty, an empty list is returned.
  ///
  /// Example:
  /// ```dart
  /// List<Widget> widgets = [Widget1(), Widget2(), Widget3()];
  /// List<Widget> separatedWidgets = widgets.withWidgetInBetween(SizedBox(width: 8));
  /// ```
  List<Widget> withWidgetInBetween(Widget widget) {
    final separatedList = <Widget>[];

    for (int i = 0; i < length; i++) {
      separatedList.add(this[i]);
      ifNotLast(i) ? separatedList.add(widget) : null;
    }
    return separatedList;
  }

  bool ifNotLast(int i) => i != length - 1;
}
