import 'package:flutter/material.dart';
import 'package:test001_aleen/test.dart';

void main() => runApp(TestApp());

class TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TestPage(),
      title: "Test Page",
      debugShowCheckedModeBanner: false,
    );
  }
}
