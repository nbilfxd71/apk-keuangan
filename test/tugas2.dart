void daftarSiswa(String nama, {int usia = 0, String kelas = 'Tidak Diketahui'}) {
  print('Pendaftaran Siswa Baru:');
  print('Nama: $nama');
  print('Usia: $usia');
  print('Kelas: $kelas');
}

void tampilkanInformasiSiswa({String? nama,  int? usia,  String? kelas}) {
  print('Informasi Siswa:');
  print('Nama: $nama');
  print('Usia: $usia');
  print('Kelas: $kelas');
}

void main() {
  daftarSiswa('Fajri');
  daftarSiswa('Nabilish', usia: 17);
  daftarSiswa('Khaerunisa', usia: 16, kelas: '11PPLG2');

  tampilkanInformasiSiswa(nama: 'Fajri', usia: 17, kelas: '11PPLG2');
  tampilkanInformasiSiswa(nama: 'Nabilish', usia: 16, kelas: '11PPLG2');
}

// higher order function

