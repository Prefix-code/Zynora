import 'package:intl/intl.dart';

class CurrencyFormatter {
  static String format(num amount) {
    final format = NumberFormat.currency(locale: 'en_IN', symbol: '₹');
    return format.format(amount);
  }
}
