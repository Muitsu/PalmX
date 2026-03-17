import 'package:flutter/material.dart';
import 'package:palmx/core/widgets/calendar/calendar_utils.dart';
import 'package:palmx/core/widgets/calendar/calendar_widget.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  // Mock data to simulate the orange dots/intensity in your screenshot
  final Map<DateTime, List<String>> _events = {
    DateTime.utc(2023, 10, 3): ['Event 1'],
    DateTime.utc(2023, 10, 4): ['Event 1'],
    DateTime.utc(2023, 10, 8): ['Event 1'],
    DateTime.utc(2023, 10, 12): ['Event 1', 'Event 2'],
    DateTime.utc(2023, 10, 13): ['Event 1', 'Event 2', 'Event 3'],
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          _buildHeader(),
          CalendarWidget<String>(
            eventData: CalendarUtils.fromMap(_events),
            focusedDay: DateTime.now(),
          ),
          _buildLegend(),
          const Spacer(),
          _buildEmptyState(),
          const Spacer(flex: 2),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "PalmX",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Icon(Icons.account_circle_outlined, color: Colors.orange[800]),
        ],
      ),
    );
  }

  Widget _buildLegend() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          const Text(
            "Less",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(width: 4),
          _legendBox(Colors.orange.shade50),
          _legendBox(Colors.orange.shade100),
          _legendBox(Colors.orange.shade400),
          _legendBox(Colors.orange.shade800),
          const SizedBox(width: 4),
          const Text(
            "More",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _legendBox(Color color) {
    return Container(
      width: 12,
      height: 12,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Column(
      children: [
        const Icon(
          Icons.calendar_today_outlined,
          size: 50,
          color: Color(0xFFE0E0E0),
        ),
        const SizedBox(height: 16),
        const Text(
          "No operations for today",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Text(
          "You haven't recorded any data for this date.",
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 24),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add, color: Colors.white),
          label: const Text(
            "Create New Operation",
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange[800],
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}
