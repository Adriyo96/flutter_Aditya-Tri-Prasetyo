import 'dart:math';

void main() {
//   KelipatanPersekutuanTerkecil operation = KelipatanPersekutuanTerkecil(12, 20);
  FaktorPersekutuanTerbesar operation = FaktorPersekutuanTerbesar(12, 20);
  print(operation.hasil());
}

abstract class Matematika {
  int hasil();
}

class KelipatanPersekutuanTerkecil implements Matematika {
  int? x;
  int? y;
  KelipatanPersekutuanTerkecil(this.x, this.y);

  @override
  hasil() {
    int besar = max(x!, y!);
    int kecil = min(x!, y!);
    for (int i = besar;; i += besar) {
        if (i % kecil == 0) return i;
    }
  }
}

class FaktorPersekutuanTerbesar implements Matematika {
  int? x;
  int? y;
  FaktorPersekutuanTerbesar(this.x, this.y);

  @override
  hasil() {
    int hasil = min(x!, y!);
    while (hasil > 0) {
        if (x! % hasil == 0 && y! % hasil == 0) {
            break;
        }
        hasil--;
    }

    return hasil;
  }
}