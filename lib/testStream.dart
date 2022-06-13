
import 'dart:async';

void main() {
  testStream().listen(println, onError: println, onDone: () => println('Done!'));
}
//
Stream<int> testStream() async* {
  // RangeStream(4, 1)
  //     .flatMap((i) => TimerStream(i, Duration(minutes: i)))
  //     .listen(print); // prints 1, 2, 3, 4
// Rx.concat(streams)
  // yield 10; // emit 10
  // await Future.delayed(Duration(seconds: 2)); // delay 2s
  // yield* Stream.fromIterable([1, 2, 3]); // emit nguyên 1 stream
  // await Future.delayed(Duration(seconds: 3)); // delay 3s
  // throw FormatException('lỗi');
  // yield 13; // hàm này đã xảy ra Exception nên số 13 không được phát ra
}

// mình sử dụng hàm println này để in ra thời gian hiện tại cho dễ quan sát output
void println(Object value) {
  print('${DateTime.now()}: $value');
}