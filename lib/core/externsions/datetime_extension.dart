import 'package:intl/intl.dart';

extension DatetimeExtension on DateTime {
  bool isNextDay() {
    final currDate = this;
    DateTime nextDay = DateTime.now().add(const Duration(days: 1));
    final isUnder24Hour = nextDay.difference(currDate).inDays.isBetween(0, 24);

    return isUnder24Hour ? (currDate.day == nextDay.day) : false;
  }

  String previewDate() {
    final curr = this;

    // final weekday = _weekdayName(curr.weekday);
    final month = _monthName(curr.month);
    final day = curr.day;
    final ordinal = _ordinalSuffix(day);
    final time =
        "${curr.hour.toString().padLeft(2, '0')}:${curr.minute.toString().padLeft(2, '0')}";

    return "$day$ordinal $month ${curr.year}  |  $time";
  }

  String timeDurationDate() {
    final curr = this;

    final weekday = _weekdayName(curr.weekday);
    final month = _shortMonthName(curr.month);
    final day = curr.day;
    final time =
        "${curr.hour.toString().padLeft(2, '0')}:${curr.minute.toString().padLeft(2, '0')}";

    return "$weekday $month $day  ${curr.year}  |  $time";
  }

  String previewMonth() {
    final curr = this;
    final month = _monthName(curr.month);
    return " $month ${curr.year}";
  }

  String _weekdayName(int weekday) {
    const names = ["Mon", "Tues", "Wed", "Thur", "Fri", "Sat", "Sun"];
    return names[weekday - 1];
  }

  String _shortMonthName(int month) {
    const names = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];
    return names[month - 1];
  }

  String _monthName(int month) {
    const names = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];
    return names[month - 1];
  }

  String _ordinalSuffix(int day) {
    if (day >= 11 && day <= 13) return "ᵗʰ"; // 11th, 12th, 13th
    switch (day % 10) {
      case 1:
        return "ˢᵗ";
      case 2:
        return "ⁿᵈ";
      case 3:
        return "ʳᵈ";
      default:
        return "ᵗʰ";
    }
  }

  String toCupertinoFormat() {
    final formatted =
        "$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')} "
        "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}";

    return formatted;
  }
}

extension NumberComparison on num {
  bool isBetween(int a, int b) {
    int minValue = a < b ? a : b;
    int maxValue = a > b ? a : b;

    return this >= minValue && this <= maxValue;
  }
}

extension DateTimeRangeFormat on DateTime {
  /// Formats a range like:
  /// Wed Jun 21 · 8:00 AM – 8:30 AM
  String formatRangeTo(DateTime end) {
    final datePart = DateFormat('EEE MMM d').format(this);
    final startTime = DateFormat('h:mm a').format(this);
    final endTime = DateFormat('h:mm a').format(end);

    return "$datePart · $startTime – $endTime";
  }

  String formatRangeToTime(DateTime end) {
    final startTime = DateFormat('h:mm a').format(this);
    final endTime = DateFormat('h:mm a').format(end);

    return "$startTime\n|\n$endTime";
  }
}
