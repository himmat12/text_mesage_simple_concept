import 'package:flutter/material.dart';
import 'package:test001_aleen/json/json_parse_into_dart_object.dart';
import 'package:test001_aleen/message/test.dart';
import 'package:test001_aleen/provider/counter_page.dart';
import 'package:test001_aleen/websocket/websocket_channel.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter In Practice"),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TestPage(),
                  ));
            },
            title: Text("Message System Concept"),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CounterPage(),
                  ));
            },
            title: Text("Provider State Management"),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SocketPage(),
                  ));
            },
            title: Text("Websocket / Stream Simple concept "),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => JsonParsingPage(),
                  ));
            },
            title: Text("JSON Serialization Concept"),
          ),
        ],
      ),
    );
  }
}
