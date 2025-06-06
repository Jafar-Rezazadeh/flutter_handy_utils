import 'package:flutter_handy_utils/utils/tree_builder_util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("buildTree -", () {
    test("should return (List<TreeOutPutItem>) when success", () {
      //arrange
      final list = [
        TreeInputItem(id: 3, parentId: 0, data: "parent"),
        TreeInputItem(id: 4, parentId: 0, data: "child1"),
        TreeInputItem(id: 5, parentId: 0, data: "child2"),
      ];

      //act
      final treeBuilder = TreeBuilder<String>();
      final result = treeBuilder.buildTree(list);

      //assert
      expect(result, isA<List<TreeOutPutItem>>());
    });

    test("should nest the items correctly by parent id", () {
      //arrange
      final items = [
        TreeInputItem(id: 1, parentId: 8565, data: "parent"),
        TreeInputItem(id: 2, parentId: 1, data: "child"),
        TreeInputItem(id: 3, parentId: 1, data: "child"),
      ];

      //act
      final builder = TreeBuilder<String>();
      final result = builder.buildTree(items);

      //assert
      expect(result.length, 1);
      expect(result.first.children.length, 2);
    });

    test("parentId Should Not Equal To id (id != parentId) ", () {
      //assert
      expect(() => TreeInputItem(id: 1, parentId: 1, data: "parent"),
          throwsA(isA<AssertionError>()));
    });
  });
}
