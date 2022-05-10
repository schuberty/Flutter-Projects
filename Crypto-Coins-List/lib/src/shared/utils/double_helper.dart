import 'package:intl/intl.dart';

class DoubleHelper {
  /// Return corret double for a [value] in a string explicited with dots
  /// separating the numbers.
  ///
  /// Examples:
  /// ```dart
  /// DoubleHelper.parseDotted('123.45')     // 123.45
  /// DoubleHelper.parseDotted('123.456')    // 123456.00
  /// DoubleHelper.parseDotted('123.456.78') // 123456.78
  /// DoubleHelper.parseDotted('12.345.67')  // 12345.67
  /// ```
  static double parseDotted(String value) {
    var splited = value.split('.');
    var result = '';
    if (splited.length > 1) {
      for (var i = 0; i < splited.length; i++) {
        if (i == splited.length - 1) {
          if (splited[i].length > 2) {
            result += splited[i];
          } else {
            result += '.${splited[i]}';
          }
        } else {
          result += splited[i];
        }
      }
    }
    return double.parse(result);
  }

  /// Return a formatted string in real acording to the given [value].
  ///
  /// Examples:
  /// ```dart
  /// DoubleHeper.toRealFormatted(123)                  // R$123,00
  /// DoubleHeper.toRealFormatted(123.456)              // R$123,45
  /// DoubleHeper.toRealFormatted(123.456, decimals: 3) // R$123,456
  /// ```
  static String formatToReal(double value, {int decimals = 2}) {
    final realFormatter = NumberFormat.currency(
      customPattern: '\u00A4#,##0.00',
      decimalDigits: decimals,
      name: 'REAL',
      locale: 'pt-BR',
      symbol: 'R\$',
    );
    return realFormatter.format(value);
  }
}
