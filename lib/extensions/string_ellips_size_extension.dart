/// Extension on String to truncate the string with an ellipsis.
extension StringEllipsSizeExtension on String {
  /// [ellipsSize] Returns a new string truncated to the specified maximum length.
  ///
  /// If the string is longer than the [maxLength], it is truncated and an
  /// ellipsis is appended. If the string is shorter than or equal to the
  /// [maxLength], it is returned unchanged.
  ///
  /// The [fromStart] parameter determines whether the truncation occurs from
  /// the start or end of the string. If [fromStart] is true, the truncation
  /// occurs from the start of the string, and the ellipsis is prepended.
  /// If `fromStart` is false (default), the truncation occurs from the end
  /// of the string, and the ellipsis is appended.
  ///
  /// Example:
  /// ```dart
  /// String text = "This is a very long string";
  /// String truncatedText = text.ellipsSize(maxLength: 10);
  /// print(truncatedText); // "This is a..."
  ///
  /// String truncatedTextFromStart = text.ellipsSize(maxLength: 10, fromStart: true);
  /// print(truncatedTextFromStart); // "...very long string"
  /// ```
  String ellipsSize({required int maxLength, bool fromStart = false}) {
    if (length > maxLength) {
      if (fromStart) {
        return "...${substring(length - maxLength)}";
      }
      return "${substring(0, maxLength)}...";
    } else {
      return this;
    }
  }
}
