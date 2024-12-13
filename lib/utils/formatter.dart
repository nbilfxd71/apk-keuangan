import 'package:intl/intl.dart';

class CurrencyFormatter {
  static String formatRupiah(double nominal) {
    return NumberFormat.currency(
      locale: 'id_ID', 
      symbol: 'Rp ', 
      decimalDigits: 0
    ).format(nominal);
  }
}