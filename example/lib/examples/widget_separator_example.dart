import 'package:flutter/material.dart';
import 'package:flutter_handy_utils/extensions/widgets_separator_.dart';

class WidgetsSeparatorExample extends StatefulWidget {
  const WidgetsSeparatorExample({super.key});

  @override
  State<WidgetsSeparatorExample> createState() =>
      _WidgetsSeparatorExampleState();
}

class _WidgetsSeparatorExampleState extends State<WidgetsSeparatorExample> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _withDivider(),
        _withGap(),
      ].withGapInBetween(30),
    );
  }

  Widget _withDivider() {
    return SizedBox(
      width: 200,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              const Text("hello 1"),
              const Text("hello 2"),
              const Text("hello 3"),
            ].withDividerInBetween(
              color: Colors.grey[400],
              endIndent: 5,
              height: 5,
              indent: 5,
              thickness: 1,
            ),
          ),
        ),
      ),
    );
  }

  Widget _withGap() {
    return SizedBox(
      width: 200,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              const Text("hello 1"),
              const Text("hello 2"),
              const Text("hello 3"),
            ].withGapInBetween(30),
          ),
        ),
      ),
    );
  }
}
