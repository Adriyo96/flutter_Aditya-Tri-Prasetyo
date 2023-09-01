class Hewan{
  var berat = 0;
}

class Mobil{
  int kapasitas = 15;
  List<int> muatan = [];
  int total = 0;
  void tambahMuatan(){
    for(int i=0; i<muatan.length; i++){
      total = total + muatan[i];
    }
    print("Total muatan = $total");
  }
  void totalMuatan(){
    if(total <= kapasitas){
      print("Berat tidak melebihi kapasitas");
    } else {
      print("Berat melebihi kapasitas");
    }
  }
}

void main(){
  Hewan sapi = Hewan();
  sapi.berat = 8;
  Hewan kambing = Hewan();
  kambing.berat = 4;
  Hewan ayam = Hewan();
  ayam.berat = 2;
  Mobil mobil = Mobil();
  mobil.muatan.add(sapi.berat);
  mobil.muatan.add(kambing.berat);
  mobil.muatan.add(ayam.berat);
  mobil.tambahMuatan();
  mobil.totalMuatan();
}