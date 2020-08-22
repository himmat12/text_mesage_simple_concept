import 'package:flutter/cupertino.dart';

class CounterBloc extends ChangeNotifier {
  int _count = 0;

  void increment() {
    _count++;
    notifyListeners();
  }

  int get count {
    return _count;
  }
}
