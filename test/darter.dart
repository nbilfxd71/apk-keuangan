class Hewan {
  late String? kategori;
  late String? nama;
  late int? berat; //kg, Ons, dll

  //constractor
  //named argument / parameter
  Hewan(this.kategori, this.nama, this.berat);

  //methode / function
  makan(int beratMakanan) {
    berat = berat! + beratMakanan;
  }

  diet(int tidakMakan) {
    berat = berat! - tidakMakan;
  }
}

void main() {
  var hewan2 = Hewan("Mamalia", "sapi", 30);
  print("Kategori : ${hewan2.kategori}");
  print("Nama Hewan : ${hewan2.nama}");
  print("Berat Hewan : ${hewan2.berat}kg");

  print("------------------");

  hewan2.makan(10);

  print("Kategori : ${hewan2.kategori}");
  print("Nama Hewan : ${hewan2.nama}");
  print("Berat Hewan : ${hewan2.berat}kg");

  print("------------------");

  //makan buah hito hito no mi
  hewan2.nama = "jerapah";
  hewan2.diet(15);

  print("Kategori : ${hewan2.kategori}");
  print("Nama Hewan : ${hewan2.nama}");
  print("Berat Hewan : ${hewan2.berat}kg");
}