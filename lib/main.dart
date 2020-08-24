import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test001_aleen/json/json_parse_into_dart_object.dart';
// import 'package:test001_aleen/provider/counter_page.dart';
import 'package:test001_aleen/provider/data_provider.dart';
// import 'package:test001_aleen/message/test.dart';
import 'package:test001_aleen/websocket/websocket_channel.dart';

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
      // home: TestPage(),
      // home: CounterPage(),
      // home: SocketPage(),
      home: JsonParsingPage(),
      title: "Test App",
      debugShowCheckedModeBanner: false,
    );
  }
}
