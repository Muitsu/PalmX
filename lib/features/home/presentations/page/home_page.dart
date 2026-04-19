import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:palmx/core/local/database.dart';
import 'package:palmx/data/local/models/operation_log_model.dart';
import 'package:palmx/features/calendar/provider/calendar_provider.dart';
import 'package:palmx/features/home/presentations/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late HomeProvider _homeProvider;
  late CalendarProvider _calendarProvider;

  @override
  void initState() {
    super.initState();

    _homeProvider = context.read<HomeProvider>();
    _calendarProvider = context.read<CalendarProvider>();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildHeader(),
          const SizedBox(height: 20),
          _buildCostCard(),
          // const SizedBox(height: 20),
          // _buildFilterChips(),
          const SizedBox(height: 25),

          // --- STREAM FOR TOTAL COUNT ---
          StreamBuilder<int>(
            stream: _homeProvider.streamCount(),
            builder: (context, snapshot) {
              final count = snapshot.data ?? 0;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "RECENT OPERATIONS",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "Showing $count entries",
                    style: const TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ],
              );
            },
          ),

          const SizedBox(height: 10),

          // --- STREAM FOR RECENT OPERATIONS LIST ---
          StreamBuilder<List<OperationLogsTableData>>(
            stream: _homeProvider.streamOperation(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              final logs = snapshot.data ?? [];

              if (logs.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "No recent operations found.",
                    textAlign: TextAlign.center,
                  ),
                );
              }

              return Column(
                children: logs.map((log) => _operationItem(log)).toList(),
              );
            },
          ),

          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "PalmX",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Icon(Icons.account_circle_outlined, color: Colors.orange[800]),
      ],
    );
  }

  // Modified to take the Drift Data object
  Widget _operationItem(OperationLogsTableData log) {
    final dateStr = DateFormat('MMM dd, yyyy').format(log.operationDate);

    return ListTile(
      onTap: () {
        _calendarProvider.viewDetails(
          context,
          data: OperationLogModel.fromDrift(log),
        );
      },
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: Colors.orange.withValues(alpha: 0.1),
        child: const Icon(Icons.opacity, color: Colors.orange),
      ),
      title: Text(
        "${log.activityType} - ${log.field ?? 'No Field'}",
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text("$dateStr • ${log.remarks ?? 'No remarks'}"),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "RM ${log.labourRate.toStringAsFixed(2)}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
            "SAVED",
            style: TextStyle(
              color: Colors.green,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCostCard() {
    return StreamBuilder<double>(
      stream: _homeProvider.streamMonthlyCost(),
      builder: (context, snapshot) {
        // 1. Extract the data or default to 0.0
        final totalCost = snapshot.data ?? 0.0;

        // 2. Format the currency (RM 12,450.00)
        final currencyFormatter = NumberFormat.currency(
          symbol: 'RM ',
          decimalDigits: 2,
        );

        // 3. Dynamic Date Range Label
        final now = DateTime.now();
        final monthLabel = DateFormat('MMM 1').format(now);
        final todayLabel = DateFormat('MMM dd, yyyy').format(now);

        return Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFFF8FBFF),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "TOTAL MONTHLY COST",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    currencyFormatter.format(totalCost),
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "↗5.2%", // You can make this dynamic later if needed
                    style: TextStyle(
                      color: Colors.orange[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                "Reflects costs from $monthLabel - $todayLabel",
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        );
      },
    );
  }

  // Widget _buildFilterChips() {
  //   return SingleChildScrollView(
  //     scrollDirection: Axis.horizontal,
  //     child: Row(
  //       children: [
  //         _chip("All Operations", true),
  //         const SizedBox(width: 8),
  //         _chip("Harvesting", false),
  //         const SizedBox(width: 8),
  //         _chip("Maintenance", false),
  //       ],
  //     ),
  //   );
  // }

  // Widget _chip(String label, bool isSelected) {
  //   return Container(
  //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
  //     decoration: BoxDecoration(
  //       color: isSelected ? Colors.orange[800] : const Color(0xFFF0F0F0),
  //       borderRadius: BorderRadius.circular(10),
  //     ),
  //     child: Text(
  //       label,
  //       style: TextStyle(
  //         color: isSelected ? Colors.white : Colors.black54,
  //         fontWeight: FontWeight.w500,
  //       ),
  //     ),
  //   );
  // }
}
