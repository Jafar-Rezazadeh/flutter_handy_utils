import 'package:flutter/material.dart';
import 'package:flutter_handy_utils/extensions/widgets_separator_.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gap/gap.dart';

void main() {
  group("withGapInBetween -", () {
    test("should not add the gap at the begging and the end of list", () {
      //arrange
      List<Widget> listOfWidgets = [
        const Text("a"),
        const Text("b"),
        const Text("c"),
      ];

      //act
      List<Widget> result = listOfWidgets.withGapInBetween(20);

      //assert
      expect(result.first, isNot(isA<Gap>()));
      expect(result.last, isNot(isA<Gap>()));
    });

    test("should return empty list when given list is empty ", () {
      //arrange
      List<Widget> listOfWidgets = [];

      //act
      List<Widget> result = listOfWidgets.withGapInBetween(20);

      //assert
      expect(result, isEmpty);
    });

    test("should add a gap in between of widgets ", () {
      //arrange
      List<Widget> listOfWidgets = [
        const Text("a"),
        const Text("b"),
        const Text("c"),
      ];

      //act
      List<Widget> result = listOfWidgets.withGapInBetween(20);

      //assert
      expect(result, [
        isA<Text>(),
        isA<Gap>(),
        isA<Text>(),
        isA<Gap>(),
        isA<Text>(),
      ]);
    });
  });

  group("withDividerBetween -", () {
    test("should not add the divider at the begging and the end of list", () {
      //arrange
      List<Widget> listOfWidgets = [
        const Text("a"),
        const Text("b"),
        const Text("c"),
      ];

      //act
      List<Widget> result = listOfWidgets.withDividerInBetween(
        color: Colors.red,
        height: 20,
        thickness: 20,
        indent: 20,
        endIndent: 20,
      );

      //assert
      expect(result.first, isNot(isA<Divider>()));
      expect(result.last, isNot(isA<Divider>()));
    });

    test("should return empty list when the list is empty", () {
      //arrange
      List<Widget> listOfWidgets = [];

      //act
      List<Widget> result = listOfWidgets.withDividerInBetween();

      //assert
      expect(result, isEmpty);
    });

    test("should add divider in between of widgets ", () {
      //arrange
      List<Widget> listOfWidgets = [
        const Text("a"),
        const Text("b"),
        const Text("c"),
      ];

      //act
      List<Widget> result = listOfWidgets.withDividerInBetween();

      //assert
      expect(result, [
        isA<Text>(),
        isA<Divider>(),
        isA<Text>(),
        isA<Divider>(),
        isA<Text>(),
      ]);
    });
  });

  group("withWidgetInBetween -", () {
    test("should add the given widget in the list", () {
      //arrange
      final List<Widget> list = [
        const Text("hello1"),
        const Text("hello2"),
        const Text("hello3"),
      ];

      //act
      final separatedList = list.withWidgetInBetween(const Icon(Icons.home));

      //assert
      expect(separatedList, contains(isA<Icon>()));
    });

    test("should add the item of list and the separator in expected order", () {
      //arrange
      final List<Widget> list = [
        const Text("hello1"),
        const Text("hello2"),
      ];

      //act
      final separatedList = list.withWidgetInBetween(const Icon(Icons.home));

      //assert
      expect(separatedList.first, isA<Text>());
      expect(separatedList[1], isA<Icon>());
      expect(separatedList.last, isA<Text>());
    });

    test("should do return empty list when given list is empty ", () {
      //arrange
      final list = <Widget>[];

      //act
      final result = list.withWidgetInBetween(const Icon(Icons.home));

      //assert
      expect(result, isEmpty);
    });
  });
}
