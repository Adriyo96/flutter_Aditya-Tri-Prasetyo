void main() {
  List<String> inputData = ["amuse", "JS Resing", "tommy kaira", "spoon", "HKS", "litchfield", "amuse", "HKS"];
  List<String> uniqueData = removeDuplicates(inputData);

  print("Data unik: $uniqueData");
}

List<String> removeDuplicates(List<String> data) {
  Set<String> uniqueSet = Set<String>();
  List<String> uniqueList = [];

  for (String item in data) {
    if (!uniqueSet.contains(item)) {
      uniqueSet.add(item);
      uniqueList.add(item);
    }
  }

  return uniqueList;
}