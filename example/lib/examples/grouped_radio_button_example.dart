import 'package:flutter/material.dart';
import 'package:flutter_handy_utils/flutter_handy_utils.dart';

class GroupedRadioButtonExample extends StatefulWidget {
  const GroupedRadioButtonExample({super.key});

  @override
  State<GroupedRadioButtonExample> createState() =>
      _GroupedRadioButtonExampleState();
}

class _GroupedRadioButtonExampleState extends State<GroupedRadioButtonExample> {
  @override
  Widget build(BuildContext context) {
    return GroupedRadioButton<String>(
      items: [
        GroupedRadioButtonItem(title: const Text("first"), value: "first"),
        GroupedRadioButtonItem(title: const Text("second"), value: "second")
      ],
      onChanged: (value) {},
    );
  }
}
