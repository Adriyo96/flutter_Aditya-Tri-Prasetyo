class Calculator {
  // Method untuk melakukan penjumlahan dua bilangan.
  double add(double num1, double num2) {
    return num1 + num2;
  }

  // Method untuk melakukan pengurangan dua bilangan.
  double subtract(double num1, double num2) {
    return num1 - num2;
  }

  // Method untuk melakukan perkalian dua bilangan.
  double multiply(double num1, double num2) {
    return num1 * num2;
  }

  // Method untuk melakukan pembagian dua bilangan.
  double divide(double num1, double num2) {
    if (num2 == 0) {
      throw Exception("Tidak dapat membagi dengan nol.");
    }
    return num1 / num2;
  }
}

void main() {
  // Contoh penggunaan class Calculator
  Calculator calculator = Calculator();
  double hasilPenjumlahan = calculator.add(5, 3);
  double hasilPengurangan = calculator.subtract(8, 2);
  double hasilPerkalian = calculator.multiply(4, 6);
  double hasilPembagian = calculator.divide(10, 2);

  print("Hasil Penjumlahan: $hasilPenjumlahan");
  print("Hasil Pengurangan: $hasilPengurangan");
  print("Hasil Perkalian: $hasilPerkalian");
  print("Hasil Pembagian: $hasilPembagian");
}