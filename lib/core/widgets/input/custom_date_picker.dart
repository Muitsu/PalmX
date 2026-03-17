import 'package:flutter/material.dart';

/// Enum to define picker types
enum DatePickerType { single, range }

/// Result class to unify output
class DatePickerResult {
  final DateTime? singleDate;
  final DateTimeRange? range;

  DatePickerResult.single(this.singleDate) : range = null;
  DatePickerResult.range(this.range) : singleDate = null;
}

class CustomDatePicker {
  static ThemeData _datePickerTheme(BuildContext context) =>
      Theme.of(context).copyWith(
        datePickerTheme: DatePickerThemeData(
          //header
          headerBackgroundColor: Color(0xFF181818),
          rangePickerHeaderBackgroundColor: Colors.blue.shade800,
          headerForegroundColor: Colors.white,
          rangePickerHeaderForegroundColor: Colors.white,
          //header divider
          dividerColor: Color(0xFF181818),
          //background
          backgroundColor: Color(0xFF212121),
          rangePickerBackgroundColor: Colors.white,
          //Month text
          subHeaderForegroundColor: Colors.white,
          //Calendar text
          weekdayStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          dayBackgroundColor: _colorState(
            selected: Colors.blue.shade800,
            unSelected: Colors.transparent,
            disable: Colors.transparent,
          ),
          dayForegroundColor: _colorState(
            selected: Colors.white,
            unSelected: Colors.white,
            disable: Colors.white30,
          ),
          todayBackgroundColor: _colorState(
            selected: Colors.blue.shade800,
            unSelected: Colors.white30,
            disable: Colors.transparent,
          ),
          todayForegroundColor: WidgetStateColor.resolveWith(
            (_) => Colors.black,
          ),

          yearForegroundColor: WidgetStateColor.resolveWith((_) => Colors.blue),

          //button
          confirmButtonStyle: _colorChange(Colors.white),
          cancelButtonStyle: _colorChange(Colors.white54),
        ),
      );

  /// Shows the picker dialog
  static Future<DatePickerResult?> show({
    required BuildContext context,
    required DatePickerType type,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    DateTime? endDateRange,
    DatePickerMode initialDatePickerMode = DatePickerMode.day,
  }) async {
    final now = DateTime.now();

    final DateTime initDate = initialDate ?? now;
    final DateTime minDate = firstDate ?? DateTime(now.year - 5);
    final DateTime maxDate = lastDate ?? DateTime(now.year + 5);

    if (type == DatePickerType.single) {
      final picked = await showDatePicker(
        context: context,
        initialDate: initDate,
        firstDate: minDate,
        lastDate: maxDate,
        initialDatePickerMode: initialDatePickerMode,
        builder: (context, Widget? child) =>
            Theme(data: _datePickerTheme(context), child: child!),
      );
      if (picked != null) {
        return DatePickerResult.single(picked);
      }
    } else {
      final picked = await showDateRangePicker(
        context: context,
        firstDate: minDate,
        lastDate: maxDate,
        initialDateRange: initialDate != null
            ? DateTimeRange(
                start: initialDate,
                end: endDateRange ?? initialDate.add(const Duration(days: 7)),
              )
            : null,
        builder: (context, Widget? child) =>
            Theme(data: _datePickerTheme(context), child: child!),
      );
      if (picked != null) {
        return DatePickerResult.range(picked);
      }
    }

    return null;
  }

  static ButtonStyle _colorChange(Color color) {
    return ButtonStyle(
      backgroundColor: _colorState(
        selected: Colors.red,
        unSelected: Colors.white10,
        disable: Colors.green,
      ),
      foregroundColor: WidgetStatePropertyAll(color),
    );
  }

  static WidgetStateColor _colorState({
    required Color selected,
    required Color unSelected,
    required Color disable,
  }) {
    return WidgetStateColor.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return selected; // selected background
      }
      if (states.contains(WidgetState.disabled)) {
        return disable; // selected background
      }
      return unSelected; // unselected background
    });
  }
}
