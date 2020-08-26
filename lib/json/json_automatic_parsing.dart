import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test001_aleen/json/api_models/user_model.dart';
import 'package:http/http.dart' as http;

class JsonAutomaticParsing extends StatefulWidget {
  @override
  _JsonAutomaticParsingState createState() => _JsonAutomaticParsingState();
}

class _JsonAutomaticParsingState extends State<JsonAutomaticParsing> {
  List<User> userLists = [];

  String url;
  List data;
  var response;

  // get users list through api using code gen
  Future getUsers() async {
    url = "https://jsonplaceholder.typicode.com/users";
    response = await http.get(url);
    data = json.decode(response.body);

    setState(() {
      userLists = data.map((json) => User.fromJson(json)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "JSON Automatic\nParsing/Serializing Into DART Objects\nUsing Code Gen Libraries",
          style:
              Theme.of(context).textTheme.subtitle2.apply(color: Colors.white),
        ),
      ),
      body: ListView.separated(
        itemCount: userLists.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(userLists[index].id.toString()),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(userLists[index].name),
                Text(userLists[index].username),
                Text(userLists[index].email),
                Text(userLists[index].phone),
                Text(userLists[index].address.street),
                Text(userLists[index].address.city),
                Text(userLists[index].address.suite),
                Text(userLists[index].address.zipcode),
                Row(
                  children: [
                    Text("Coordinates  -->"),
                    SizedBox(width: 8),
                    Text("lat : [ " + userLists[index].address.geo.lat + " ] "),
                    SizedBox(width: 8),
                    Text("lng : [ " + userLists[index].address.geo.lng + " ] "),
                  ],
                ),
                Text(userLists[index].website),
                Text(userLists[index].company.name),
                Text(userLists[index].company.catchPhrase),
                Text(userLists[index].company.bs),
              ],
            ),
          );
        },
      ),
    );
  }
}
