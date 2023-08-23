double kelilingPersegi(double sisi) {
  return 4 * sisi;
}

double luasPersegi(double sisi) {
  return sisi * sisi;
}

void main() {
  double sisiPersegi = 5;

  double kelilingP = kelilingPersegi(sisiPersegi);
  double luasP = luasPersegi(sisiPersegi);

  print("Keliling Persegi: $kelilingP");
  print("Luas Persegi: $luasP");
}