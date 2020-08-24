import 'dart:async';

class NumberCreator {
  final _controller = StreamController<int>();
  int _count = 0;
  NumberCreator() {
    Timer.periodic(Duration(seconds: 1), (t) {
      _controller.sink.add(_count);
      _count++;
    });
  }

  Stream<int> get stream {
    return _controller.stream;
  }
}
