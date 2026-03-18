import 'package:flutter/services.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  final _onlyDigits = RegExp(r'\d+'); // match only digits

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Extract only digits, ignore anything else (pasted, typed, etc)
    final matches = _onlyDigits.allMatches(newValue.text);
    final digitString = matches.map((m) => m.group(0)).join();

    if (digitString.isEmpty) {
      return const TextEditingValue(
        text: "0.00",
        selection: TextSelection.collapsed(offset: 4),
      );
    }

    // Convert to number
    final digits = int.parse(digitString);

    // Format to 2 decimal places
    final value = (digits / 100).toStringAsFixed(2);

    return TextEditingValue(
      text: value,
      selection: TextSelection.collapsed(offset: value.length),
    );
  }
}
