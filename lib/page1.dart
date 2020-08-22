import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test001_aleen/provider/data_provider.dart';

class Page1 extends StatelessWidget {
  // int count = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<CounterBloc>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Page 1"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value.count.toString() + " counts",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
