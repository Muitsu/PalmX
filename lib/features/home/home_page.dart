import 'package:flutter/material.dart';
import 'package:palmx/features/operation/operation_log/operation_log_summary_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "PalmX",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.account_circle_outlined, color: Colors.orange[800]),
            ],
          ),
          const SizedBox(height: 20),
          _buildCostCard(),
          const SizedBox(height: 20),
          _buildFilterChips(),
          const SizedBox(height: 25),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "RECENT OPERATIONS",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              Text(
                "Showing 24 entries",
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
            ],
          ),
          const SizedBox(height: 10),
          _operationItem(
            "Fertilizing - Block A",
            "Oct 24, 2023 • Maintenance",
            "RM 1,200.00",
            "PAID",
            Colors.orange,
          ),
          _operationItem(
            "Harvesting - Section 12",
            "Oct 23, 2023 • Labor",
            "RM 3,450.50",
            "PENDING",
            Colors.deepOrange,
          ),
          _operationItem(
            "FFB Transport to Mill",
            "Oct 22, 2023 • Logistics",
            "RM 850.00",
            "PAID",
            Colors.blue,
          ),
          const SizedBox(height: 100), // Space for FAB/Nav
        ],
      ),
    );
  }

  Widget _buildCostCard() {
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
              const Text(
                "RM 12,450.00",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8),
              Text(
                "↗5.2%",
                style: TextStyle(
                  color: Colors.orange[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Text(
            "Reflects costs from Oct 1 - Oct 24, 2023",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _chip("All Operations", true),
          const SizedBox(width: 8),
          _chip("Harvesting", false),
          const SizedBox(width: 8),
          _chip("Maintenance", false),
        ],
      ),
    );
  }

  Widget _chip(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.orange[800] : const Color(0xFFF0F0F0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black54,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _operationItem(
    String title,
    String subtitle,
    String amount,
    String status,
    Color iconColor,
  ) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => OperationLogSummaryPage()),
        );
      },
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: iconColor.withValues(alpha: 0.1),
        child: Icon(Icons.opacity, color: iconColor),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(amount, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(
            status,
            style: TextStyle(
              color: status == "PAID" ? Colors.green : Colors.grey,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
