import 'package:flutter/material.dart';
import 'package:flutter_handy_utils/extensions/string_ellips_size_extension.dart';
import 'package:flutter_handy_utils/extensions/widgets_separator_.dart';

class StringEllipsSizeExample extends StatelessWidget {
  const StringEllipsSizeExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(children: [
            const TextSpan(text: "fromStart = true :  "),
            TextSpan(
              text:
                  "Nisi amet consectetur laboris nisi incididunt Lorem in excepteur amet qui."
                      .ellipsSize(maxLength: 20, fromStart: true),
              style: Theme.of(context).textTheme.titleMedium,
            )
          ]),
        ),
        Text.rich(
          TextSpan(children: [
            const TextSpan(text: "fromStart = false :  "),
            TextSpan(
              text:
                  "Nisi amet consectetur laboris nisi incididunt Lorem in excepteur amet qui."
                      .ellipsSize(maxLength: 20, fromStart: false),
              style: Theme.of(context).textTheme.titleMedium,
            )
          ]),
        ),
      ].withGapInBetween(20),
    );
  }
}
