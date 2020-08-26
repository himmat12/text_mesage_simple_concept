import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test001_aleen/home_page.dart';
import 'package:test001_aleen/provider/data_provider.dart';

String endPoint = "http://eurekaschoolapp.com/eureka";
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
      home: HomePage(),
      title: "Flutter In Practice",
      debugShowCheckedModeBanner: false,
    );
  }
}
