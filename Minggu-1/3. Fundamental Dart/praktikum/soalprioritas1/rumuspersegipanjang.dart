double kelilingPersegiPanjang(double panjang, double lebar) {
  return 2 * (panjang + lebar);
}

double luasPersegiPanjang(double panjang, double lebar) {
  return panjang * lebar;
}

void main() {
  double panjangPersegiPanjang = 6;
  double lebarPersegiPanjang = 8;

  double kelilingPP = kelilingPersegiPanjang(panjangPersegiPanjang, lebarPersegiPanjang);
  double luasPP = luasPersegiPanjang(panjangPersegiPanjang, lebarPersegiPanjang);

  print("Keliling Persegi Panjang: $kelilingPP");
  print("Luas Persegi Panjang: $luasPP");
}