import 'dart:math';

import 'package:project/project.dart' as project;

const int listSize = 25000000;
int desiredNumber = Random().nextInt(25000000);

void main(List<String> arguments) {
  longestCommonSubstring('blue', 'clues');
}

void longestCommonSubsequence(String word1, String word2) {
  final table = project.longestCommonSubsequence(word1, word2);

  for (List<int> element in table) {
    print(element);
  }
}

void longestCommonSubstring(String word1, String word2) {
  final table = project.longestCommonSubstring(word1, word2);

  for (List<int> element in table) {
    print(element);
  }
}

void stations() {
  final coverStates = {
    'mt',
    'wa',
    'or',
    'id',
    'nv',
    'ut',
    'ca',
    'az',
  };

  final stations = <String, Set<String>>{}..addAll(
      {
        'kone': {'id', 'nv', 'uy'},
        'ktwo': {'wa', 'id', 'mt'},
        'kthree': {'or', 'nv', 'ca'},
        'kfour': {'nv', 'ut'},
        'kfive': {'ca', 'az'},
      },
    );

  final finalStations = project.stationSet(coverStates, stations);
  print(finalStations);
}

void sets() {
  final fruits = {'avocado', 'tomato', 'banana'};
  final vegetables = {'beet', 'carrot', 'tomato'};

  print(fruits.union(vegetables));
  print(fruits.intersection(vegetables));
  print(fruits.difference(vegetables));
  print(vegetables.difference(fruits));
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

void recursiveCount() {
  final Stopwatch stopwatch = Stopwatch()..start();
  print(
      project.recursiveCount([0, 21, 3, 1, 6, 5, 81, 2, 14, 56, 32, 1, 9, 8]));
  stopwatch.stop();
  print(stopwatch.elapsedMilliseconds);
}

void breadthFirstSearch() {
  final graph = <String, List<String>>{};
  graph.addAll(
    <String, List<String>>{
      'you': ['alice', 'bob', 'claire'],
      'bob': ['anuj', 'peggy'],
      'alice': ['peggy'],
      'claire': ['thom', 'jonny'],
      'anuj': [],
      'peggy': [],
      'thom': [],
      'jonny': [],
    },
  );

  project.search(graph, 'you');
}

void bookHashMap() {
  final book = <String, double>{};
  book.addAll(
    {
      'apple': 0.67,
      'milk': 1.49,
      'avocado': 1.49,
    },
  );

  print(book);
  print(book['apple']);
  print(book['milk']);
  print(book['avocado']);
}

void voteHashMap() {
  final voted = <String, bool>{};

  project.checkVoter('tom', voted);
  project.checkVoter('mike', voted);
  project.checkVoter('mike', voted);
}

void djikstra() {
  final graph = <String, Map<String, double>>{}..addAll(
      {
        'start': {
          'a': 6,
          'b': 2,
        },
        'a': {
          'end': 1,
        },
        'b': {
          'a': 3,
          'end': 5,
        },
        'end': {},
      },
    );

  final costs = <String, double>{
    'a': 6,
    'b': 2,
    'end': double.infinity,
  };

  final parents = <String, String?>{
    'a': 'start',
    'b': 'start',
    'end': null,
  };

  project.djikstra(graph, costs, parents);
  print(graph);
  print(costs);
  print(parents);
}
