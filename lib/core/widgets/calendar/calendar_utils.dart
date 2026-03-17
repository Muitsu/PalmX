import 'dart:collection';
import 'package:table_calendar/table_calendar.dart';

class CalendarUtils {
  /// Custom hashcode for dates to treat different times on the same day as the same key
  static int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  /// The grouping logic moved to a static utility method
  static LinkedHashMap<DateTime, List<T>> groupEventDates<T>({
    required List<T> eventList,
    required DateTime? Function(T event) dateNormalizer,
  }) {
    final map = LinkedHashMap<DateTime, List<T>>(
      equals: isSameDay,
      hashCode: getHashCode,
    );

    for (final event in eventList) {
      final rawDate = dateNormalizer(event);
      if (rawDate == null) continue;

      // Normalize to midnight to ensure consistency
      final date = DateTime(rawDate.year, rawDate.month, rawDate.day);

      if (map[date] == null) {
        map[date] = [];
      }
      map[date]!.add(event);
    }

    return map;
  }

  static LinkedHashMap<DateTime, List<T>> fromMap<T>(
    Map<DateTime, List<T>> map,
  ) {
    final linkedMap = LinkedHashMap<DateTime, List<T>>(
      equals: isSameDay,
      hashCode: (DateTime key) =>
          key.day * 1000000 + key.month * 10000 + key.year,
    );

    linkedMap.addAll(map);
    return linkedMap;
  }

  static LinkedHashMap<DateTime, List<T>> emptyEvent<T>() {
    return LinkedHashMap<DateTime, List<T>>(
      equals: isSameDay,
      hashCode: (DateTime key) =>
          key.day * 1000000 + key.month * 10000 + key.year,
    );
  }
}
