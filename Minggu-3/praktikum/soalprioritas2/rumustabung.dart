import 'dart:math';

double volumeTabung(double jariJari, double tinggi) {
  return pi * pow(jariJari, 2) * tinggi;
}

void main() {
  double jariJariTabung = 7;
  double tinggiTabung = 10;

  double volume = volumeTabung(jariJariTabung, tinggiTabung);

  print("Volume Tabung: $volume");
}