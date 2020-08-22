import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test001_aleen/counter_page.dart';
import 'package:test001_aleen/provider/data_provider.dart';
import 'package:test001_aleen/test.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => CounterBloc(),
        child: TestApp(),
      ),
    );

class TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: TestPage(),
      home: CounterPage(),
      // title: "Test Page",
      // debugShowCheckedModeBanner: false,
    );
  }
}
