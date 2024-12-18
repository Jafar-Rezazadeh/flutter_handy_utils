import 'package:flutter_handy_utils/extensions/string_ellips_size_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("ellipsSize", () {
    test("should return same string when length is less than maxLength", () {
      //arrange
      const text = "test";

      //act
      final result = text.ellipsSize(maxLength: 20);

      //assert
      expect(result, text);
    });

    test("should ellips string from end when fromStart is false", () {
      //arrange
      const text = "Irure consectetur nulla ex cillum anim sint aliqua.";

      //act
      final result = text.ellipsSize(maxLength: 10, fromStart: false);

      //assert
      expect(result, "${text.substring(0, 10)}...");
    });

    test("should ellips string from start when fromStart is true", () {
      //arrange
      const text = "Irure consectetur nulla ex cillum anim sint aliqua.";

      //act
      final result = text.ellipsSize(maxLength: 10, fromStart: true);

      //assert
      expect(result, "...${text.substring(text.length - 10)}");
    });
  });
}
