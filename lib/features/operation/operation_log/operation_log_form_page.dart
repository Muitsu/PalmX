import 'package:flutter/material.dart';

class OperationLogFormPage extends StatelessWidget {
  const OperationLogFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Operation Log",
          style: TextStyle(
            color: Color(0xFF1A2B47),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabel("Date"),
            _buildTextField(
              hint: "mm/dd/yyyy",
              icon: Icons.calendar_today_outlined,
              isDate: true,
            ),

            _buildLabel("Activity Type"),
            _buildDropdownField(
              "Harvesting & Collection",
              Icons.shopping_bag_outlined,
            ),

            _buildLabel("Field"),
            _buildDropdownField(
              "Division A - Block 12",
              Icons.location_on_outlined,
            ),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel("Ha today"),
                      _buildTextField(
                        hint: "0.00",
                        icon: Icons.architecture_outlined,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel("Mandays"),
                      _buildTextField(hint: "0", icon: Icons.group_outlined),
                    ],
                  ),
                ),
              ],
            ),

            _buildLabel("Remarks"),
            _buildTextField(
              hint: "Additional observations...",
              icon: Icons.edit_note_outlined,
              maxLines: 3,
            ),

            const Divider(height: 40),

            Row(
              children: [
                Icon(
                  Icons.calculate_outlined,
                  color: Colors.orange[800],
                  size: 20,
                ),
                const SizedBox(width: 8),
                const Text(
                  "Cost Calculation",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 15),
            _buildCostSummaryCard(),

            const SizedBox(height: 25),
            _buildTotalCostRow(),

            const SizedBox(height: 20),
            _buildMetricCards(),

            const SizedBox(height: 30),
            _buildSubmitButton(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // --- UI Components ---

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 12),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey,
          fontSize: 13,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    required IconData icon,
    bool isDate = false,
    int maxLines = 1,
  }) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: Icon(icon, color: Colors.blueGrey[300]),
        suffixIcon: isDate
            ? const Icon(Icons.calendar_month, color: Colors.orange)
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.orange),
        ),
      ),
    );
  }

  Widget _buildDropdownField(String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueGrey[300]),
          const SizedBox(width: 12),
          Text(value, style: const TextStyle(fontSize: 15)),
          const Spacer(),
          const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildCostSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF9F6),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.orange.shade50),
      ),
      child: Column(
        children: [
          _costItem("Labour cost", "12 workers x RM65.00", "780.00"),
          _costItem("Supervision cost", "2 units x RM85.00", "170.00"),
          _costItem("Driver cost", "4 units x RM55.00", "220.00"),
          _costItem("Material cost", "50 bags x RM45.50", "2,275.00"),
          _costItem("Evit cost", "System overhead 10%", "344.50", isLast: true),
        ],
      ),
    );
  }

  Widget _costItem(
    String title,
    String sub,
    String amount, {
    bool isLast = false,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      sub,
                      style: const TextStyle(color: Colors.grey, fontSize: 11),
                    ),
                  ],
                ),
              ),
              Text(
                "RM $amount",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              const Icon(Icons.chevron_right, size: 18, color: Colors.grey),
            ],
          ),
        ),
        if (!isLast) Divider(color: Colors.grey.shade200),
      ],
    );
  }

  Widget _buildTotalCostRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "TOTAL OPERATION COST",
          style: TextStyle(
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold,
            fontSize: 11,
          ),
        ),
        Text(
          "RM 3,789.50",
          style: TextStyle(
            color: Colors.orange[900],
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ],
    );
  }

  Widget _buildMetricCards() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _metricCard("COST / HA", "RM 473"),
        _metricCard("COST / MT", "RM 15.2"),
        _metricCard("COST / PALM", "RM 3.40"),
      ],
    );
  }

  Widget _metricCard(String label, String value) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 9,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.send_rounded, color: Colors.white),
        label: const Text(
          "Submit Log",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
        ),
      ),
    );
  }
}
