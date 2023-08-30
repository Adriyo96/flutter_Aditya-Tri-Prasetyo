void main() {
  List<List<dynamic>> nestedList = [
    [1, "one"],
    [2, "two"],
    [3, "three"],
    [4, "four"],
    [5, "five"],
  ];

  Map<int, String> nestedMap = Map.fromEntries(
    nestedList.map((subList) => MapEntry(subList[0], subList[1])),
  );

  print("Nested Map: $nestedMap");
}