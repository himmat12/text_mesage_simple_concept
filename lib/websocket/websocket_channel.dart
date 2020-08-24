import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test001_aleen/main.dart';
import 'package:http/http.dart' as http;
import 'package:test001_aleen/websocket/stream_model.dart';

class SocketPage extends StatefulWidget {
  @override
  _SocketPageState createState() => _SocketPageState();
}

class _SocketPageState extends State<SocketPage> {
  TextEditingController _message = TextEditingController();
  List<String> messages = [];

  addToMesagesList() {
    setState(() {
      messages.add(_message.text);
      _message.clear();
    });
  }

  ScrollController _controller = ScrollController();

  String url;
  var data;
  var response;
  bool isLoading = true;

  Future getMessage() async {
    url = "$endPoint/test.php";
    response = await http.get(url, headers: {'accept': 'application/json'});
    // setState(() {
    //   isLoading = false;
    // });
    data = json.decode(response.body);

    return data;
  }

  NumberCreator numberCreator = new NumberCreator();
  // @override
  // void initState() {
  //   super.initState();
  //   getMessage();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Socket Flutter"),
        actions: [
          FlatButton(
            onPressed: () {
              setState(() {
                messages.clear();
              });
            },
            child: Text("Clear All"),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: numberCreator.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(child: Text(snapshot.data.toString()));
          } else if (snapshot.hasError) {
            return Text("error!");
          } else if (snapshot.connectionState == ConnectionState.done) {
            return Text("Done");
          } else {
            return Text("Loading ...");
          }
        },
      ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       FutureBuilder(
      //         future: getMessage(),
      //         builder: (context, snapshot) {
      //           if (snapshot.hasData) {
      //             return ListView.builder(
      //               shrinkWrap: true,
      //               physics: NeverScrollableScrollPhysics(),
      //               itemCount: data.length,
      //               itemBuilder: (context, index) {
      //                 return Center(child: Text(data[index]['name']));
      //               },
      //             );
      //           } else {
      //             return Text("Loading ...");
      //           }
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      // body: Column(
      //   children: [
      //     Expanded(
      //         child: ListView(
      //       controller: _controller,
      //       children: [
      //         ListView.builder(
      //           // reverse: true,
      //           shrinkWrap: true,
      //           itemCount: messages.length,
      //           physics: NeverScrollableScrollPhysics(),
      //           itemBuilder: (context, index) {
      //             Timer(Duration(milliseconds: 300), () {
      //               return _controller
      //                   .jumpTo(_controller.position.maxScrollExtent);
      //             });
      //             return ListTile(
      //               title: Text(messages[index]),
      //             );
      //           },
      //         ),
      //       ],
      //     )),
      //     Container(
      //       padding: EdgeInsets.all(10),
      //       child: Row(
      //         children: [
      //           Expanded(
      //             child: TextField(
      //               controller: _message,
      //               decoration: InputDecoration(
      //                 contentPadding: EdgeInsets.all(10),
      //                 border: OutlineInputBorder(),
      //                 hintText: "Type message ...",
      //               ),
      //             ),
      //           ),
      //           IconButton(
      //             onPressed: () {
      //               if (_message.text.isNotEmpty) {
      //                 addToMesagesList();
      //               }

      //               print(messages);
      //             },
      //             icon: Icon(Icons.send),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
