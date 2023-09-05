import 'dart:math';

void main() {
//   Kubus bangun = Kubus();
//   bangun.sisi = 6;

  Balok bangun = Balok();
  bangun.panjang = 4;
  bangun.lebar = 6;
  bangun.tinggi = 5;
  print(bangun.volume());
}

class BangunRuang {
  double? panjang;
  double? lebar;
  double? tinggi;

  num volume() {
    return panjang! * lebar! * tinggi!;
  }
}

class Kubus extends BangunRuang {
  double? sisi;

  @override
  num volume() {
    return pow(sisi!, 3);
  }
}

class Balok extends BangunRuang {

}