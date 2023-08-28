void main() {
  int nilai = 96;
  
  String hasil;
  
  if (nilai > 70) {
    hasil = "Angka $nilai merupakan Nilai A";
  } else if (nilai > 40) {
    hasil = "Angka $nilai merupakan Nilai B";
  } else if (nilai > 0) {
    hasil = "Angka $nilai merupakan Nilai C";
  } else {
    hasil = "";
  }
  
  print("$hasil");
}
