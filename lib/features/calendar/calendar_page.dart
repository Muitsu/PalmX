import 'package:flutter/material.dart';
import 'package:palmx/core/widgets/calendar/calendar_utils.dart';
import 'package:palmx/core/widgets/calendar/calendar_widget.dart';
import 'package:palmx/data/local/datasource/operation_log_local_datasource.dart';
import 'package:palmx/data/local/models/operation_log_model.dart';
import 'package:palmx/features/operation/operation_log/operation_log_form_page.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late ValueNotifier<DateTime> focusedDay;
  late ValueNotifier<List<OperationLogModel>> operationsForSelectedDay;
  List<OperationLogModel> _monthLogs = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    focusedDay = ValueNotifier(DateTime.now());
    operationsForSelectedDay = ValueNotifier([]);
    _fetchMonthlyLogs(focusedDay.value); // Initial fetch
  }

  // --- Database Logic ---
  Future<void> _fetchMonthlyLogs(DateTime monthDate) async {
    setState(() => _isLoading = true);
    // Call the new monthly method
    final logs = await OperationLogsLocalDatasource().getByMonth(monthDate);
    _monthLogs = logs.map((e) => OperationLogModel.fromDrift(e)).toList();
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            CalendarWidget<OperationLogModel>(
              focusedDay: focusedDay.value,
              eventData: CalendarUtils.groupEventDates(
                eventList: _monthLogs,
                dateNormalizer: (val) => val.operationDate,
              ),
              onPageChanged: (newMonthDate) {
                focusedDay.value = newMonthDate;
                _fetchMonthlyLogs(newMonthDate);
              },
              onDaySelected: (operations, selectedDay) {
                focusedDay.value = selectedDay;
                operationsForSelectedDay.value = operations;
              },
            ),

            // Logic to show loading, list, or empty state
            if (_isLoading)
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: CircularProgressIndicator(),
              )
            else if (_monthLogs.isEmpty)
              _buildEmptyState()
            else
              _buildLogsList(), // New widget to show the data

            const SizedBox(height: kBottomNavigationBarHeight + 60),
          ],
        ),
      ),
    );
  }

  // New widget to display the fetched logs
  Widget _buildLogsList() {
    return ValueListenableBuilder(
      valueListenable: operationsForSelectedDay,
      builder: (context, value, _) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: value.length,
          itemBuilder: (context, index) {
            final log = value[index];
            return ListTile(
              leading: const Icon(Icons.agriculture, color: Colors.green),
              title: Text(log.activityType ?? "-"),
              subtitle: Text("${log.field} • ${log.hectar} Ha"),
              trailing: Text("RM ${log.labourRate}"),
            );
          },
        );
      },
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
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OperationLogFormPage()),
            );
          },
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
