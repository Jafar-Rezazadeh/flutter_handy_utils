/// A utility class for building  structured parent-child relationships.
///
class TreeBuilder<T> {
  //
  /// Builds a tree from a list of `TreeInputItem`s.
  ///
  /// * The tree is represented as a list of TreeOutPutItem, each of which is a `TreeOutPutItem` containing a parent item and a list of children.
  ///
  /// * The children of each item are also `TreeOutPutItem`s, and the tree is fully recursive. The depth of each item is also set, with root items having a depth of 0.
  ///
  /// * if parent does not exists in the list, the children will not included
  List<TreeOutPutItem<T>> buildTree(List<TreeInputItem<T>> items) {
    Map<int, _TreeNode<T>> categoryNodeMap = _buildNodeMap(items);
    List<_TreeNode<T>> rootNodes =
        _getOnlyRootsWithItsChildren(categoryNodeMap);

    for (var rootNode in rootNodes) {
      _assignDepthToChildren(rootNode, 0);
    }

    final outPutItems = _convertToTreeOutPutItem(rootNodes);

    return outPutItems;
  }

  Map<int, _TreeNode<T>> _buildNodeMap(List<TreeInputItem<T>> items) {
    Map<int, _TreeNode<T>> itemNodeMap = {};

    for (var item in items) {
      itemNodeMap[item.id] = _TreeNode(root: item);
    }

    // Create the tree structure by linking parent and child nodes
    for (var item in items) {
      if (item.parentId != 0) {
        _TreeNode? parentNode = itemNodeMap[item.parentId];
        parentNode?.addChild(itemNodeMap[item.id]!);
      }
    }

    return itemNodeMap;
  }

  List<_TreeNode<T>> _getOnlyRootsWithItsChildren(
      Map<int, _TreeNode<T>> categoryNodeMap) {
    // Collect all ids
    final allIds = categoryNodeMap.values.map((node) => node.root.id).toSet();
    // A root is any node whose parentId is 0 or whose parentId is not in the list
    return categoryNodeMap.values
        .where((node) =>
            node.root.parentId == 0 || !allIds.contains(node.root.parentId))
        .toList();
  }

  // Recursive function to assign depth (indentation level) to each node
  void _assignDepthToChildren(_TreeNode<T> node, int currentDepth) {
    node.depth = currentDepth;

    for (var child in node.children) {
      _assignDepthToChildren(
        child,
        currentDepth + 1,
      ); // Increase depth for each child level
    }
  }

  List<TreeOutPutItem<T>> _convertToTreeOutPutItem(
    List<_TreeNode<T>> rootNodes,
  ) {
    return rootNodes
        .map(
          (e) => TreeOutPutItem<T>(
            data: e.root.data,
            children: _convertToTreeOutPutItem(e.children),
            depth: e.depth,
          ),
        )
        .toList();
  }
}

class _TreeNode<T> {
  TreeInputItem<T> root;
  List<_TreeNode<T>> children = [];
  bool isChecked;
  int depth;

  _TreeNode({required this.root, this.isChecked = false, this.depth = 0});

  void addChild(_TreeNode<T> child) {
    children.add(child);
  }
}

/// [parentId] = 0 means that this item is parent
class TreeInputItem<T> {
  final int id;
  final int parentId;
  final T data;

  TreeInputItem({
    required this.id,
    required this.parentId,
    required this.data,
  }) : assert(id != parentId, "id and parentId Should Not be Equal");
}

class TreeOutPutItem<T> {
  final T data;
  final List<TreeOutPutItem<T>> children;
  final int depth;

  TreeOutPutItem({
    required this.data,
    required this.depth,
    required this.children,
  });
}
