void faktorial(int angka) {
  print("Faktor-faktor dari $angka adalah:");

  for (int i = 1; i < angka; i++) {
    if (angka % i == 0) {
      print(i);
    }
  }
}

void main() {
  int inputAngka = 24;

  faktorial(inputAngka);
}