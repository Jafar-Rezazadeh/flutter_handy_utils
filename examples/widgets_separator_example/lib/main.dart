import 'package:flutter/material.dart';
import 'package:flutter_handy_utils/extensions/widget_separator_.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _withDivider(),
              _withGap(),
            ].withGapInBetween(30),
          ),
        ),
      ),
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
