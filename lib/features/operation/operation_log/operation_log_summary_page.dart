import 'package:flutter/material.dart';
import 'operation_log_form_page.dart';

class OperationLogSummaryPage extends StatelessWidget {
  const OperationLogSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1A2B47)),
          onPressed: () => Navigator.pop(context),
        ),

        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Color(0xFF1A2B47)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => OperationLogFormPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Header Section
            Center(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF4ED),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.shield_outlined,
                      color: Colors.orange[800],
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Operation Summary",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A2B47),
                    ),
                  ),
                  const Text(
                    "Ref ID: #OPS-9942-2024",
                    style: TextStyle(color: Colors.blueGrey, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Top Info Card
            _buildInfoCard(),

            const SizedBox(height: 32),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Itemized Statement",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A2B47),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Statement List
            _buildStatementItem(
              Icons.inventory_2_outlined,
              "Materials & Supplies",
              "\$1,240.00",
            ),
            _buildStatementItem(
              Icons.group_outlined,
              "Labor (42.5 hrs)",
              "\$850.00",
            ),
            _buildStatementItem(
              Icons.handyman_outlined,
              "Equipment Rental",
              "\$300.00",
            ),
            _buildStatementItem(
              Icons.local_shipping_outlined,
              "Logistics & Transport",
              "\$125.50",
            ),

            const SizedBox(height: 24),

            // Grand Total Card
            _buildTotalCard(),

            const SizedBox(height: 40),

            // Footer Disclaimer
            _buildDisclaimer(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FBFF),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.blue.shade50),
      ),
      child: Column(
        children: [
          _infoRow("OPERATION AREA", "Zone 4 - Manufacturing Plant"),
          const Divider(height: 30),
          _infoRow("LEAD SUPERVISOR", "Sarah Jenkins"),
          const Divider(height: 30),
          _infoRow("COMPLETION DATE", "Oct 24, 2023"),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.blueGrey,
            fontSize: 11,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: Color(0xFF1A2B47),
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatementItem(IconData icon, String title, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueGrey[400], size: 22),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xFF1A2B47),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            price,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A2B47),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF4ED),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFFFE5D9)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "GRAND TOTAL",
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  letterSpacing: 1,
                ),
              ),
              Text(
                "Net 30 Payment Terms Apply",
                style: TextStyle(color: Colors.blueGrey[300], fontSize: 10),
              ),
            ],
          ),
          const Text(
            "\$2,515.50",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A2B47),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDisclaimer() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FBFF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline, color: Colors.orange[800], size: 18),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              "By committing this entry, you verify that all line items have been inspected and match the operational logs for Phase 4.",
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 12,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
