import 'package:flutter/material.dart';

/// A Flutter widget that displays a group of radio buttons.
///
/// The [GroupedRadioButton] widget displays a group of radio buttons, where only one
/// radio button can be selected at a time. The radio buttons are displayed in a column
/// layout.
///
/// The [items] parameter is a required list of [GroupedRadioButtonItem] objects that
/// define the radio buttons to be displayed. Each [GroupedRadioButtonItem] object contains
/// a [title] widget, a [secondary] widget (optional), and a [value] of type [T].
///
/// The [onChanged] parameter is a required callback function that is invoked when a radio
/// button is selected. The callback function takes a parameter of type [T?], which represents
/// the selected value.
///
/// The [initialGroupValue] parameter is an optional parameter that specifies the initial
/// value of the selected radio button. If not provided, the first radio button in the list
/// will be selected by default.
///
/// Example usage:
/// ```dart
/// GroupedRadioButton<String>(
///   items: [
///     GroupedRadioButtonItem(title: Text("Option 1"), value: "option1"),
///     GroupedRadioButtonItem(title: Text("Option 2"), value: "option2"),
///   ],
///   onChanged: (value) {
///     print(value);
///   },
///   initialGroupValue: "option1",
/// ),
/// ```
class GroupedRadioButton<T> extends StatefulWidget {
  final Function(T? value) onChanged;
  final List<GroupedRadioButtonItem<T>> items;
  final T? initialGroupValue;
  const GroupedRadioButton({
    super.key,
    required this.items,
    required this.onChanged,
    this.initialGroupValue,
  });

  @override
  State<GroupedRadioButton<T>> createState() => _GroupedRadioButtonState<T>();
}

class _GroupedRadioButtonState<T> extends State<GroupedRadioButton<T>> {
  T? groupValue;

  @override
  void initState() {
    super.initState();
    groupValue = widget.initialGroupValue ?? widget.items.first.value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.items
          .map(
            (e) => RadioListTile<T>(
              title: e.title,
              secondary: e.secondary,
              dense: true,
              value: e.value,
              groupValue: groupValue,
              selected: groupValue == e.value,
              visualDensity: VisualDensity.compact,
              onChanged: (value) {
                setState(() => groupValue = value);
                widget.onChanged(value);
              },
            ),
          )
          .toList(),
    );
  }
}

class GroupedRadioButtonItem<T> {
  final Widget title;
  final Widget? secondary;
  final T value;

  GroupedRadioButtonItem({
    required this.title,
    required this.value,
    this.secondary,
  });
}
