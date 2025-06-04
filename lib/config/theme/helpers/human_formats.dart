
import 'package:intl/intl.dart';

class HumanFormats {
  static String humanReadbleNumber(double number) {
    final formatter = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
    );

    return formatter.format(number);
  }

}
