import 'package:flutter/material.dart';
import 'package:flutter_handy_utils/flutter_handy_utils.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ListView(
            children: tree.map((item) => _listItem(item)).toList(),
          ),
        ),
      ),
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
