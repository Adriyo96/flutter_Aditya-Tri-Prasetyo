void main() {
  double jariJari = 5;
  
  double luasLingkaran = hitungLuasLingkaran(jariJari);
  
  print("Luas lingkaran dengan jari-jari $jariJari adalah $luasLingkaran");
}

double hitungLuasLingkaran(double jariJari) {
  return 3.14 * jariJari * jariJari;
}
