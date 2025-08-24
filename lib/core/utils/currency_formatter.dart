import 'package:intl/intl.dart';

/// Format value into Indian Rupees (₹)
String formatCurrency(num value) {
  final format = NumberFormat.currency(
    locale: 'en_IN', // Indian locale
    symbol: '₹',    // Rupee symbol
  );
  return format.format(value);
}
