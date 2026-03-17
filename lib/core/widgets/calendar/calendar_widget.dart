import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:palmx/core/externsions/datetime_extension.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget<T> extends StatefulWidget {
  final LinkedHashMap<DateTime, List<T>> eventData;
  final DateTimeRange? showDateRange;
  final DateTime focusedDay;
  final void Function(DateTime)? onPageChanged;
  final void Function(List<T>, DateTime selectedDay)? onDaySelected;
  final CalendarFormat calendarFormat;
  final RangeSelectionMode rangeSelectionMode;
  final EdgeInsetsGeometry padding;
  const CalendarWidget({
    super.key,
    required this.eventData,
    required this.focusedDay,
    this.showDateRange,
    this.onPageChanged,
    this.calendarFormat = CalendarFormat.month,
    this.onDaySelected,
    this.rangeSelectionMode = RangeSelectionMode.toggledOff,
    this.padding = const EdgeInsets.all(8),
  });

  @override
  State<CalendarWidget<T>> createState() => _CalendarWidgetState<T>();
}

class _CalendarWidgetState<T> extends State<CalendarWidget<T>> {
  late final PageController _pageController;
  late final ValueNotifier<DateTime> _focusedDay;
  late RangeSelectionMode _rangeSelectionMode;
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  @override
  void initState() {
    super.initState();
    _focusedDay = ValueNotifier(widget.focusedDay);
    _selectedDay = _focusedDay.value;
    _rangeSelectionMode = widget.rangeSelectionMode;
    widget.onDaySelected?.call(_getEventsForDay(_selectedDay!), _selectedDay!);
  }

  @override
  void dispose() {
    _focusedDay.dispose();
    super.dispose();
  }

  // Mapping events to days
  List<T> _getEventsForDay(DateTime day) => widget.eventData[day] ?? <T>[];

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (isSameDay(_selectedDay, selectedDay)) return;
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay.value = focusedDay;
      _rangeStart = null; // Important to clean those
      _rangeEnd = null;
      _rangeSelectionMode = RangeSelectionMode.toggledOff;
    });

    widget.onDaySelected?.call(_getEventsForDay(selectedDay), selectedDay);
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay.value = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      widget.onDaySelected?.call(_getEventsForRange(start, end), start);
    } else if (start != null) {
      widget.onDaySelected?.call(_getEventsForDay(start), start);
    } else if (end != null) {
      widget.onDaySelected?.call(_getEventsForDay(end), end);
    }
  }

  List<T> _getEventsForRange(DateTime start, DateTime end) {
    final days = _daysInRange(start, end);

    return [for (final d in days) ..._getEventsForDay(d)];
  }

  List<DateTime> _daysInRange(DateTime first, DateTime last) {
    final dayCount = last.difference(first).inDays + 1;
    return List.generate(
      dayCount,
      (index) => DateTime.utc(first.year, first.month, first.day + index),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCustomHeader(),
        Padding(
          padding: widget.padding,
          child: TableCalendar(
            onCalendarCreated: (controller) => _pageController = controller,
            firstDay:
                widget.showDateRange?.start ??
                DateTime(
                  DateTime.now().year,
                  DateTime.now().month - 3,
                  DateTime.now().day,
                ),
            lastDay:
                widget.showDateRange?.end ??
                DateTime(
                  DateTime.now().year,
                  DateTime.now().month + 3,
                  DateTime.now().day,
                ),
            focusedDay: _focusedDay.value,
            startingDayOfWeek: StartingDayOfWeek.monday,
            daysOfWeekStyle: DaysOfWeekStyle(
              weekendStyle: TextStyle(color: Colors.red.withValues(alpha: .7)),
            ),
            calendarStyle: CalendarStyle(
              outsideDaysVisible: false,

              todayDecoration: BoxDecoration(
                color: Colors.orange.withValues(alpha: 0.3),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.orange[800],
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
              ),
              markerDecoration: const BoxDecoration(
                color: Colors.deepOrange,
                shape: BoxShape.circle,
              ),
            ),
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, day, events) {
                if (events.isEmpty) return const SizedBox();
                return Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(color: Colors.blueAccent),
                    child: Center(
                      child: Text(
                        events.length.toString(),
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
            eventLoader: _getEventsForDay,
            // --- Calendar Style ----
            calendarFormat: widget.calendarFormat,
            // --- Header Style ----
            headerVisible: false,
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              leftChevronVisible: false,
              rightChevronVisible: false,
            ),
            // --- Range Selection ---
            rangeSelectionMode: _rangeSelectionMode,
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            onRangeSelected: _onRangeSelected,
            // --- Day Selection ---
            onDaySelected: _onDaySelected,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onPageChanged: (focusedDay) {
              _focusedDay.value = focusedDay;
              widget.onPageChanged?.call(focusedDay);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCustomHeader() {
    return ValueListenableBuilder<DateTime>(
      valueListenable: _focusedDay,
      builder: (context, day, _) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  day.previewMonth(),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withValues(alpha: .4)),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.chevron_left, size: 22),
                  onPressed: () {
                    if (!context.mounted) return;
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  },
                ),
              ),
              SizedBox(width: 10),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withValues(alpha: .4)),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.chevron_right, size: 22),
                  onPressed: () {
                    if (!context.mounted) return;
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
