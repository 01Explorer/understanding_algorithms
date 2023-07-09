import 'dart:math';

import 'package:project/project.dart' as project;

const int listSize = 25000000;
int desiredNumber = Random().nextInt(25000000);

void main(List<String> arguments) {
  recursiveSum();
}

void binarySearch() {
  List<int> intList = List.generate(listSize, (index) => ++index);
  final Stopwatch stopwatch = Stopwatch();

  stopwatch.start();
  int? desiredPosition = project.binarySearch(intList, desiredNumber);
  stopwatch.stop();
  print('Binary');
  print(desiredPosition);
  print(stopwatch.elapsedMilliseconds);
  stopwatch.reset();

  stopwatch.start();
  desiredPosition = intList.indexOf(desiredNumber);
  stopwatch.stop();
  print('First Where');
  print(desiredPosition);
  print(stopwatch.elapsedMilliseconds);
  stopwatch.reset();

  stopwatch.start();
  desiredPosition = intList.indexWhere((element) => element == desiredNumber);
  stopwatch.stop();
  print('Index Where');
  print(desiredPosition);
  print(stopwatch.elapsed.inMilliseconds);
}

void recursiveFactorial() {
  final Stopwatch stopwatch = Stopwatch()..start();
  print(project.recursiveFactorial(100));
  stopwatch.stop();
  print(stopwatch.elapsedMilliseconds);
}

void recursiveSum() {
  final Stopwatch stopwatch = Stopwatch()..start();
  print(project.recursiveSum([0, 21, 3, 1, 6, 5, 81, 2, 14, 56, 32, 1, 9, 8]));
  stopwatch.stop();
  print(stopwatch.elapsedMilliseconds);
}
