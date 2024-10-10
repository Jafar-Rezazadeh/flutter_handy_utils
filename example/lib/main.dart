import 'package:flutter/material.dart';
import 'package:flutter_handy_utils/flutter_handy_utils.dart';

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
}

class TreeBuilderExample extends StatefulWidget {
  const TreeBuilderExample({super.key});

  @override
  State<TreeBuilderExample> createState() => _TreeBuilderExampleState();
}

class _TreeBuilderExampleState extends State<TreeBuilderExample> {
  //
  final sampleData = [
    {"id": 1, "parentId": 0, "data": "parent", "checked": true},
    {"id": 2, "parentId": 1, "data": "child", "checked": true},
    {"id": 3, "parentId": 2, "data": "descendant", "checked": true},
    {"id": 4, "parentId": 2, "data": "descendant", "checked": true}
  ];
  final treeBuilder = TreeBuilder<Map<String, dynamic>>();
  late List<TreeOutPutItem<Map<String, dynamic>>> tree;

  List<TreeOutPutItem<Map<String, dynamic>>> _generateTree() {
    final treeInputItems = sampleData
        .map((e) => TreeInputItem(
              id: e["id"] as int,
              parentId: e["parentId"] as int,
              data: e,
            ))
        .toList();

    return treeBuilder.buildTree(treeInputItems);
  }

  @override
  void initState() {
    tree = _generateTree();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: tree.map((item) => _listItem(item)).toList(),
    );
  }

  Widget _listItem(TreeOutPutItem<Map<String, dynamic>> item) {
    return Column(
      children: [
        _rootItem(item),
        ..._children(item),
      ],
    );
  }

  ListTile _rootItem(TreeOutPutItem<Map<String, dynamic>> item) {
    return ListTile(
      leading: Checkbox(
        value: item.data["checked"],
        onChanged: (value) => setState(() => item.data["checked"] = value!),
      ),
      title: Text(item.data["data"] +
          "       -       " +
          "item depth: " +
          item.depth.toString()),
    );
  }

  Iterable<Widget> _children(TreeOutPutItem<Map<String, dynamic>> item) {
    return item.children.map(
      (child) => Padding(
        padding: const EdgeInsets.only(left: 16),
        child: _listItem(child),
      ),
    );
  }
}

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
              thickness: 2,
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
