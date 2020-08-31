import 'package:flutter/material.dart';
import 'package:test001_aleen/stream/stream_model/test_data_stream.dart';

class StreamPage extends StatefulWidget {
  @override
  _StreamPageState createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  StreamData streamData = StreamData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream In Flutter"),
        actions: [
          StreamBuilder(
              stream: streamData.streamCount,
              builder: (context, snapshot) {
                return Container(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Chip(label: Text((snapshot.data ?? 0).toString())),
                );
              }),
        ],
      ),
      body: StreamBuilder(
        stream: streamData.streamData,
        builder: (context, snapshot) {
          var data = snapshot.data;
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(data[index]),
                    );
                  },
                )
              : snapshot.hasError
                  ? Center(
                      child: Text("error ${snapshot.error}"),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    );
        },
      ),
    );
  }
}
