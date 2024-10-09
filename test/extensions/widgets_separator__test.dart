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
}
