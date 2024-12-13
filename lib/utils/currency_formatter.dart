import 'package:intl/intl.dart';

class CurrencyFormatter {
  // Method to format a number into Rupiah format
  static String format(double amount) {
    final formatter = NumberFormat.currency(
      locale: 'id_ID', // For Indonesian format (IDR)
      symbol: 'Rp ',    // Currency symbol
      decimalDigits: 0, // Number of decimal digits
    );
    return formatter.format(amount);
  }
}

  // Metode untuk memformat angka menjadi format Rupiah (versi dengan integer)
  String formatRupiah(int amount) {
    final rupiahFormat = NumberFormat.simpleCurrency(locale: 'id_ID');
    return rupiahFormat.format(amount);
  }
