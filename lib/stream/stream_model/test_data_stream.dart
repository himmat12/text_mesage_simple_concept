import 'dart:async';

List<String> itemList = [
  'Item 1',
  'Item 2',
  'Item 3',
  'Item 4',
  'Item 5',
  'Item 6'
];

class StreamData {
  Stream<List<String>> get streamData async* {
    for (var i = 0; i < itemList.length; i++) {
      await Future.delayed(Duration(seconds: 1));
      yield itemList.sublist(0, i + 1);
    }
  }

  final StreamController<int> _streamCountController = StreamController<int>();

  Stream<int> get streamCount => _streamCountController.stream;

  StreamData() {
    streamData.listen((list) => _streamCountController.add(list.length));
  }
}
