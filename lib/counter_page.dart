import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test001_aleen/page1.dart';
import 'package:test001_aleen/page2.dart';
import 'package:test001_aleen/provider/data_provider.dart';

class CounterPage extends StatelessWidget {
  // final int count = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<CounterBloc>(
      builder: (context, counterBloc, _) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              counterBloc.increment();
              print(counterBloc.count);
            },
            child: Icon(Icons.add),
          ),
          appBar: AppBar(
            title: Text("Counter"),
          ),
          body: Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    counterBloc.count.toString() + " counts",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Page1(),
                            ));
                      },
                      child: Text("page 1")),
                  FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Page2(),
                            ));
                      },
                      child: Text("page 2")),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
