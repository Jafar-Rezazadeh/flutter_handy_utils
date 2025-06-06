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
    return SizedBox(
      height: 300,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _withDivider(),
          _withGap(),
          _withWidget(),
        ].withGapInBetween(30),
      ),
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
              _titleWidget("withDividerInBetween"),
              Column(
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _titleWidget(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(fontWeight: FontWeight.bold),
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
              _titleWidget("withGapInBetween"),
              Column(
                children: [
                  const Text("hello 1"),
                  const Text("hello 2"),
                  const Text("hello 3"),
                ].withGapInBetween(30),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _withWidget() {
    return SizedBox(
      width: 200,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              _titleWidget("withWidgetInBetween"),
              Column(
                children: [
                  const Text("hello 1"),
                  const Text("hello 2"),
                  const Text("hello 3"),
                ].withWidgetInBetween(
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Icon(Icons.arrow_downward),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
