import 'dart:math';

double kelilingLingkaran(double jariJari) {
  return 2 * pi * jariJari;
}

double luasLingkaran(double jariJari) {
  return pi * jariJari * jariJari;
}

void main() {
  double jariJariLingkaran = 7;

  double keliling = kelilingLingkaran(jariJariLingkaran);
  double luas = luasLingkaran(jariJariLingkaran);

  print("Keliling Lingkaran: $keliling");
  print("Luas Lingkaran: $luas");
}