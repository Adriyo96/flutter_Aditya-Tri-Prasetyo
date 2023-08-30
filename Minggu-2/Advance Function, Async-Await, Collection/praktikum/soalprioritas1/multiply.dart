Future<List<int>> multiplyListAsync(List<int> data, int multiplier) async {
  List<int> result = [];

  await Future.forEach(data, (int value) async {
    int multipliedValue = value * multiplier;
    result.add(multipliedValue);
  });

  return result;
}

void main() async {
  List<int> inputData = [1, 2, 3, 4, 5];
  int multiplier = 2;

  List<int> multipliedList = await multiplyListAsync(inputData, multiplier);
  print("Multiplied List: $multipliedList");
}