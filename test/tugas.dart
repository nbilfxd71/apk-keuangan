void main() {
  // Pendaftaran Militer

  var tinggiBadan = 170;
  var beratBadan = 60;

  var apakahTinggiBadanCukup = tinggiBadan >= 170;
  var apakahBeratBadanCukup = beratBadan >= 55;

  var diterima = apakahTinggiBadanCukup && apakahBeratBadanCukup;

  if (diterima) {
    print("Selamat Anda Dinyatakan Lulus");
  } else {
    print('Maaf Anda Tidak Lolos');
  }
}
