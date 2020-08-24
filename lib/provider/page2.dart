import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test001_aleen/provider/data_provider.dart';

class Page2 extends StatelessWidget {
  // int count = 0;
  @override
  Widget build(BuildContext context) {
    var counterBloc = Provider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              counterBloc.count.toString() + " counts",
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
