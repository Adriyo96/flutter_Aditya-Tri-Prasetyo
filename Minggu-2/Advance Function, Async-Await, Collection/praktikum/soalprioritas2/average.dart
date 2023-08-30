void main() {
  List<int> values = [7, 5, 3, 5, 2, 1];
  double average = calculateAverage(values);
  int roundedAverage = average.ceil();

  print("Nilai rata-rata (setelah pembulatan ke atas): $roundedAverage");
}

double calculateAverage(List<int> values) {
  int sum = 0;
  
  for (int value in values) {
    sum += value;
  }
  
  return sum / values.length;
}