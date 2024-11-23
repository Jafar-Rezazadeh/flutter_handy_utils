import 'package:flutter/material.dart';
import 'package:flutter_handy_utils/widgets/grouped_radio_button.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("initialValue -", () {
    testWidgets(
        "should first RadioButton selected when initialGroupeValue is null",
        (tester) async {
      //arrange
      final radioButtons = [
        GroupedRadioButtonItem(title: const Text("first"), value: "first"),
        GroupedRadioButtonItem(title: const Text("second"), value: "second")
      ];
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GroupedRadioButton<String>(
              items: radioButtons,
              onChanged: (value) {},
            ),
          ),
        ),
      );

      //verification
      final firstRadioButtonFinder = find.widgetWithText(
        RadioListTile<String>,
        "first",
      );

      //act
      final isSelected = tester
          .widget<RadioListTile<String>>(
            firstRadioButtonFinder,
          )
          .selected;

      //assert
      expect(isSelected, true);
    });
    testWidgets(
        "should radioButton be selected when initial value matches the value of radioButton ",
        (tester) async {
      //arrange
      final radioButtons = [
        GroupedRadioButtonItem(title: const Text("first"), value: "first"),
        GroupedRadioButtonItem(title: const Text("second"), value: "second")
      ];
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GroupedRadioButton<String>(
              initialGroupValue: "second",
              items: radioButtons,
              onChanged: (value) {},
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      //verification
      final selectedRadioButtonFinder = find.widgetWithText(
        RadioListTile<String>,
        "second",
      );
      expect(selectedRadioButtonFinder, findsOneWidget);

      //act
      final selectedRadio =
          tester.widget<RadioListTile<String>>(selectedRadioButtonFinder);

      //assert
      expect(selectedRadio.selected, true);
    });
  });

  group("onChange -", () {
    testWidgets("should invoke the onChanged when a radio button is changed",
        (tester) async {
      //arrange
      bool isInvoked = false;

      final radioButtons = [
        GroupedRadioButtonItem(title: const Text("first"), value: "first"),
        GroupedRadioButtonItem(title: const Text("second"), value: "second"),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GroupedRadioButton<String>(
              items: radioButtons,
              onChanged: (value) {
                isInvoked = true;
              },
            ),
          ),
        ),
      );

      //verification
      final secondRadioTileFinder = find.widgetWithText(
        RadioListTile<String>,
        "second",
      );
      expect(secondRadioTileFinder, findsOneWidget);

      //act
      await tester.tap(secondRadioTileFinder);
      await tester.pumpAndSettle();

      //assert
      final secondRadioItem = tester.widget<RadioListTile<String>>(
        secondRadioTileFinder,
      );

      expect(secondRadioItem.selected, true);
      expect(isInvoked, true);
    });
  });
}
