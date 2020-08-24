import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test001_aleen/json/user_model.dart';

class JsonParsingPage extends StatefulWidget {
  @override
  _JsonParsingPageState createState() => _JsonParsingPageState();
}

class _JsonParsingPageState extends State<JsonParsingPage> {
  String url;
  List data;
  var response;

// JSON Parsing into dart objects
  List<User> usersList = [];
  Future getData() async {
    url = "https://jsonplaceholder.typicode.com/users";
    response = await http.get(url);
    setState(() {
      data = json.decode(response.body);
      usersList = data.map((json) => User.fromJson(json)).toList();
    });
  }

  // JSON parsing with raw JSON dyamic data
  Future getData1() async {
    url = "https://jsonplaceholder.typicode.com/users";
    response = await http.get(url);
    setState(() {
      data = json.decode(response.body);
      // usersList = data.map((json) => User.fromJson(json)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JSON Parsing\nInto DART Object"),
      ),

      // parsing raw JSON data
      // body: ListView.builder(
      //   itemCount: data.length,
      //   itemBuilder: (context, index) {
      //     return ListTile(
      //       title: Text(data[index]['address']['geo']['lat']),
      //     );
      //   },
      // ),

      //JSON parsing by converting dynamic json data into prefered objects (DART objetc)
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: usersList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Name :" + usersList[index].name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Email :" + usersList[index].email),
                Text("Street :" + usersList[index].address.street),
                Text("Cuty :" + usersList[index].address.city),
                Row(
                  children: [
                    Text("Coordinates  -->"),
                    SizedBox(width: 8),
                    Text("lat : [ " + usersList[index].address.geo.lat + " ] "),
                    SizedBox(width: 8),
                    Text("lng : [ " + usersList[index].address.geo.lng + " ] "),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
