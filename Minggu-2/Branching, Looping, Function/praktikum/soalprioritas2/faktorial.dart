void faktorial(int nilai) {
  print("Faktorial dari angka $nilai adalah:");

  for (int i = 1; i < nilai; i++) {
    if (nilai % i == 0) {
      print(i);
    }
  }
}

void main() {
  int inputNilai = 50;

  faktorial(inputNilai);
}