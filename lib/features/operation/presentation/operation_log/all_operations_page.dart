import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:palmx/core/widgets/input/custom_date_picker.dart';
import 'package:palmx/data/local/models/operation_log_model.dart';
import 'package:palmx/features/calendar/provider/calendar_provider.dart';
import 'package:palmx/features/operation/presentation/operation_log/dropdown_service.dart';
import 'package:palmx/features/operation/presentation/provider/all_operations_provider.dart';
import 'package:provider/provider.dart';

class AllOperationsPage extends StatelessWidget {
  const AllOperationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1A2B47)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "All Operations",
          style: TextStyle(
            color: Color(0xFF1A2B47),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: Consumer<AllOperationsProvider>(
          builder: (context, provider, _) {
            return Column(
              children: [
                _FilterBar(provider: provider),
                const Divider(height: 1),
                Expanded(
                  child: StreamBuilder<List<OperationLogModel>>(
                    stream: provider.filteredStream,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      final logs = snapshot.data ?? [];

                      if (logs.isEmpty) {
                        return _EmptyState(hasFilters: provider.hasFilters);
                      }

                      return ListView.builder(
                        padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
                        itemCount: logs.length,
                        itemBuilder: (context, index) {
                          return _OperationTile(data: logs[index]);
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _FilterBar extends StatelessWidget {
  final AllOperationsProvider provider;
  const _FilterBar({required this.provider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
      child: Row(
        children: [
          Expanded(
            child: _FilterChip(
              icon: Icons.agriculture_outlined,
              label: provider.selectedActivity?.name ?? "All Activities",
              isActive: provider.selectedActivity != null,
              onTap: () => DropdownService.showActivity(
                context,
                initialValue: provider.selectedActivity,
                onSelected: provider.setActivity,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _FilterChip(
              icon: Icons.calendar_month_outlined,
              label: provider.selectedMonth != null
                  ? DateFormat('MMM yyyy').format(provider.selectedMonth!)
                  : "All Months",
              isActive: provider.selectedMonth != null,
              onTap: () async {
                final result = await CustomDatePicker.show(
                  context: context,
                  type: DatePickerType.single,
                  initialDate: provider.selectedMonth ?? DateTime.now(),
                );
                final picked = result?.singleDate;
                if (picked == null) return;
                provider.setMonth(DateTime(picked.year, picked.month, 1));
              },
            ),
          ),
          if (provider.hasFilters)
            IconButton(
              onPressed: provider.clearFilters,
              tooltip: "Clear filters",
              icon: Icon(Icons.filter_alt_off_outlined, color: Colors.grey[600]),
            ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _FilterChip({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isActive ? Colors.deepOrange : Colors.grey[700]!;
    return Material(
      color: isActive
          ? Colors.deepOrange.withValues(alpha: 0.08)
          : Colors.grey[100],
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isActive ? Colors.deepOrange.withValues(alpha: 0.4) : Colors.transparent,
            ),
          ),
          child: Row(
            children: [
              Icon(icon, size: 16, color: color),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
              Icon(Icons.keyboard_arrow_down, size: 16, color: color),
            ],
          ),
        ),
      ),
    );
  }
}

class _OperationTile extends StatelessWidget {
  final OperationLogModel data;
  const _OperationTile({required this.data});

  @override
  Widget build(BuildContext context) {
    final dateStr = DateFormat('MMM dd, yyyy').format(data.operationDate);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FBFF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        onTap: () {
          context.read<CalendarProvider>().viewDetails(context, data: data);
        },
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          backgroundColor: Colors.orange.withValues(alpha: 0.1),
          child: const Icon(Icons.opacity, color: Colors.orange),
        ),
        title: Text(
          "${data.activityType ?? 'Unknown'} - ${data.field ?? 'No Field'}",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text("$dateStr • ${data.remarks?.isNotEmpty == true ? data.remarks : 'No remarks'}"),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "RM ${data.costPerPalm.toStringAsFixed(2)}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "${data.hectar ?? 0} Ha",
              style: const TextStyle(color: Colors.grey, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final bool hasFilters;
  const _EmptyState({required this.hasFilters});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.search_off_rounded, size: 56, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              hasFilters
                  ? "No operations match your filters."
                  : "No operations recorded yet.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (hasFilters) ...[
              const SizedBox(height: 8),
              Text(
                "Try adjusting or clearing your filters.",
                style: TextStyle(color: Colors.grey[400], fontSize: 13),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
