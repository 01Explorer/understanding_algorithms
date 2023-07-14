import 'dart:collection';

int? binarySearch(List<int> list, int desiredNumber) {
  int highest = list.length - 1;
  int lowest = 0;
  int mid;

  while (lowest <= highest) {
    mid = (lowest + highest) ~/ 2;

    if (list[mid] == desiredNumber) return mid;
    if (list[mid] > desiredNumber) {
      highest = mid - 1;
    } else {
      lowest = mid + 1;
    }
  }

  return null;
}

int recursiveFactorial(int value) {
  if (value == 1) {
    return 1;
  }
  return value * recursiveFactorial(value - 1);
}

int recursiveSum(List<int> array) {
  if (array.isEmpty) {
    return 0;
  }
  final List<int> newArray = [...array]..removeAt(0);
  return array[0] + recursiveSum(newArray);
}

int recursiveCount(List<int> array) {
  if (array.isEmpty) {
    return 0;
  }
  final List<int> newArray = [...array]..removeAt(0);
  return 1 + recursiveCount(newArray);
}

bool search(Map<String, List<String>> graph, String name) {
  final searchQueue = Queue()..addAll(graph[name] ?? []);
  final searched = List<String>.empty(growable: true);

  while (searchQueue.isNotEmpty) {
    final String person = searchQueue.removeFirst();
    if (searched.contains(person) == false) {
      if (_personIsSeller(person)) {
        print('$person is a Mango seller!');
        return true;
      } else {
        searchQueue.addAll(graph[person] ?? []);
        searched.add(person);
      }
    }
  }
  return false;
}

bool _personIsSeller(String name) {
  return name.endsWith('m');
}

void checkVoter(String name, Map<String, bool> voted) {
  if (voted[name] != null) {
    print('Kick them out!');
  } else {
    voted[name] = true;
    print('Let them vote');
  }
}

void djikstra(
  Map<String, Map<String, double>> graph,
  Map<String, double> costs,
  Map<String, String?> parents,
) {
  final processeds = <String>[];
  String? node = findTheCheapestOne(costs, processeds);

  while (node != null) {
    final cost = costs[node];
    final neighbors = graph[node];
    for (String neighbor in neighbors!.keys) {
      final double newCost = cost! + neighbors[neighbor]!;
      if (costs[neighbor]! > newCost) {
        costs[neighbor] = newCost;
        parents[neighbor] = node;
      }
    }
    processeds.add(node);
    node = findTheCheapestOne(costs, processeds);
  }
}

String? findTheCheapestOne(Map<String, double> costs, List<String> processed) {
  double cheapestCost = double.infinity;
  String? cheapestNode;

  for (String node in costs.keys) {
    final double cost = costs[node]!;
    if (cost < cheapestCost && !processed.contains(node)) {
      cheapestCost = cost;
      cheapestNode = node;
    }
  }
  return cheapestNode;
}
