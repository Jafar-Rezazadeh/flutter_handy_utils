import 'package:flutter/material.dart';

import 'examples/string_ellips_size_example.dart';
import 'examples/tree_builder_example.dart';
import 'examples/widget_separator_example.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("flutter_handy_utils example"),
          shadowColor: Colors.black,
          elevation: 5,
          scrolledUnderElevation: 0,
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Column(
          children: [
            _treeBuilder(),
            _widgetsSeparator(),
            _stringEllipsSize(),
          ],
        ),
      ),
    );
  }

  ExpansionTile _widgetsSeparator() {
    return const ExpansionTile(
      title: Text("WidgetsSeparator"),
      childrenPadding: EdgeInsets.all(10),
      children: [
        WidgetsSeparatorExample(),
      ],
    );
  }

  ExpansionTile _treeBuilder() {
    return const ExpansionTile(
      title: Text("TreeBuilder"),
      childrenPadding: EdgeInsets.all(10),
      children: [
        TreeBuilderExample(),
      ],
    );
  }

  Widget _stringEllipsSize() {
    return const ExpansionTile(
      title: Text("StringEllipsSize"),
      childrenPadding: EdgeInsets.all(10),
      children: [
        StringEllipsSizeExample(),
      ],
    );
  }
}
