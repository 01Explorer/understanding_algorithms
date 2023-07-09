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
