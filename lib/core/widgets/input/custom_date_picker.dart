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
  static ThemeData _datePickerTheme(
    BuildContext context,
  ) => Theme.of(context).copyWith(
    datePickerTheme: DatePickerThemeData(
      //header
      headerBackgroundColor: Colors.orange,
      rangePickerHeaderBackgroundColor: Colors.orange.shade800,
      headerForegroundColor: Colors.white,
      rangePickerHeaderForegroundColor: Colors.black,
      //header divider
      dividerColor: Colors.black12,
      //background
      backgroundColor: Colors.white,
      rangePickerBackgroundColor: Colors.black,
      //Month text
      subHeaderForegroundColor: Colors.black,
      //Calendar text
      weekdayStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      dayBackgroundColor: _colorState(
        selected: Colors.orange.shade800,
        unSelected: Colors.transparent,
        disable: Colors.transparent,
      ),
      dayForegroundColor: _colorState(
        selected: Colors.black,
        unSelected: Colors.black,
        disable: Colors.black38,
      ),
      todayBackgroundColor: _colorState(
        selected: Colors.orange,
        unSelected: Colors.black38,
        disable: Colors.transparent,
      ),
      todayForegroundColor: WidgetStateColor.resolveWith((_) => Colors.black),

      yearForegroundColor: WidgetStateColor.resolveWith((_) => Colors.orange),

      //button
      confirmButtonStyle: _colorChange(
        background: Colors.orange,
        foreground: Colors.white,
      ),
      cancelButtonStyle: _colorChange(
        background: Colors.black12,
        foreground: Colors.black54,
      ),
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

  static ButtonStyle _colorChange({
    required Color background,
    required Color foreground,
  }) {
    return ButtonStyle(
      backgroundColor: _colorState(
        selected: Colors.red,
        unSelected: background,
        disable: Colors.green,
      ),
      foregroundColor: WidgetStatePropertyAll(foreground),
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
