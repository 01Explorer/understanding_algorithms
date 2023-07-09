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
