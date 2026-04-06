import 'package:flutter/material.dart';
import 'package:palmx/features/calendar/provider/calendar_provider.dart';
import 'package:provider/provider.dart';
import 'package:palmx/core/widgets/calendar/calendar_utils.dart';
import 'package:palmx/core/widgets/calendar/calendar_widget.dart';
import 'package:palmx/features/operation/presentation/operation_log/operation_log_form_page.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    context.read<CalendarProvider>().init();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final provider = context.watch<CalendarProvider>();

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),

            CalendarWidget(
              focusedDay: provider.focusedDay.value,
              eventData: CalendarUtils.groupEventDates(
                eventList: provider.monthLogs,
                dateNormalizer: (val) => val.operationDate,
              ),
              onPageChanged: provider.onPageChanged,
              onDaySelected: provider.onDaySelected,
            ),

            if (provider.isLoading)
              const Padding(
                padding: EdgeInsets.all(20),
                child: CircularProgressIndicator(),
              )
            else
              _buildLogsList(provider),

            const SizedBox(height: kBottomNavigationBarHeight + 60),
          ],
        ),
      ),
    );
  }

  Widget _buildLogsList(CalendarProvider provider) {
    return ValueListenableBuilder(
      valueListenable: provider.operationsForSelectedDay,
      builder: (context, value, _) {
        if (value.isEmpty) {
          return _buildEmptyState();
        }
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
        const Icon(Icons.calendar_today_outlined, size: 50),
        const SizedBox(height: 16),
        const Text(
          "No operations for today",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Text("You haven't recorded any data."),
        const SizedBox(height: 24),
        ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OperationLogFormPage()),
            );
          },
          icon: const Icon(Icons.add),
          label: const Text("Create New Operation"),
        ),
      ],
    );
  }
}
