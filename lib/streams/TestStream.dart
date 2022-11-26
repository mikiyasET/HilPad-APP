import 'dart:async';

class TestStream {
  var _count = 1;
  final _controller = StreamController<int>();

  TestStream() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      _controller.sink.add(_count);
      _count++;
    });
  }

  Stream<int> get stream => _controller.stream;
}
