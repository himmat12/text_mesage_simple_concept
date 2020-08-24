import 'package:flutter/material.dart';
import 'package:test001_aleen/message/message_model.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  TextEditingController _textMessage = TextEditingController();

  List<Message> messages = [];

  addMessage() {
    setState(() {
      Message message = new Message(textMessage: _textMessage.text);
      messages.add(message);
    });

    return messages;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages"),
        actions: [
          IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                setState(() {
                  _textMessage.clear();
                  messages.clear();
                });
              })
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // text message feild
              Expanded(
                child: TextField(
                  controller: _textMessage,
                  decoration: InputDecoration(
                    hintText: "abc ...",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              // send button
              IconButton(
                onPressed: () {
                  addMessage();
                  for (var i in messages) {
                    print(i.textMessage);
                  }
                },
                icon: Icon(Icons.send),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Container(
                  // width: MediaQuery.of(context).size.width / 2,
                  // height: 20,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(messages[index].textMessage),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
