import 'package:flutter/material.dart';
import 'package:palmx/core/widgets/utils.dart';

class LabourCostSheet extends StatefulWidget {
  final ScrollController? sc;
  const LabourCostSheet({super.key, this.sc});

  @override
  State<LabourCostSheet> createState() => _LabourCostSheetState();
}

class _LabourCostSheetState extends State<LabourCostSheet> {
  // Controllers for the input fields
  final mandaysController = TextEditingController(text: "0");
  final basicRateController = TextEditingController(text: "0.00");
  final otHoursController = TextEditingController(text: "0");
  final otRateController = TextEditingController(text: "0.00");
  final quantityController = TextEditingController(text: "0");
  final unitRateController = TextEditingController(text: "0.00");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          controller: widget.sc,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle bar at the top
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Labour Cost',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A233A),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Review and update calculation',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.close,
                      color: Colors.blueGrey,
                      size: 20,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.blueGrey.withValues(alpha: 0.05),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Basic Labor Section
              _buildSectionHeader('BASIC LABOR'),
              Row(
                children: [
                  Expanded(
                    child: buildTextField(
                      label: 'Mandays',
                      hint: "",
                      ctrl: mandaysController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  _multiplier(),
                  Expanded(
                    child: buildTextField(
                      label: 'Rate (Flat)',
                      hint: "",
                      ctrl: basicRateController,
                      keyboardType: TextInputType.number,
                      prefixWidget: Padding(
                        padding: const EdgeInsets.only(top: 14, left: 10),
                        child: Text("RM "),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Overtime Section
              _buildSectionHeader('OVERTIME'),
              Row(
                children: [
                  Expanded(
                    child: buildTextField(
                      label: 'Hours',
                      hint: "",
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      ctrl: otHoursController,
                    ),
                  ),
                  _multiplier(),
                  Expanded(
                    child: buildTextField(
                      label: 'OT Rate',
                      hint: "",
                      ctrl: otRateController,
                      keyboardType: TextInputType.number,
                      prefixWidget: Padding(
                        padding: const EdgeInsets.only(top: 14, left: 10),
                        child: Text("RM "),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Output Based Section
              _buildSectionHeader('PIECE RATE'),
              Row(
                children: [
                  Expanded(
                    child: buildTextField(
                      label: 'Quantity',
                      hint: "",
                      ctrl: quantityController,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  _multiplier(),
                  Expanded(
                    child: buildTextField(
                      label: 'Unit Rate',
                      hint: "",
                      ctrl: unitRateController,
                      keyboardType: TextInputType.number,
                      prefixWidget: Padding(
                        padding: const EdgeInsets.only(top: 14, left: 10),
                        child: Text("RM "),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
        bottomNavigationBar: _bottomCalculationButton(),
      ),
    );
  }

  Widget _bottomCalculationButton() {
    return Padding(
      padding: EdgeInsets.only(left: 24, right: 24, bottom: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Divider(color: Color(0xFFEEEEEE), thickness: 1),
          ),
          // Total Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total Cost',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A233A),
                ),
              ),
              const Text(
                'RM0.00',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF1A233A),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),

          // Action Button
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange[800], // Matches the visual brand
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Save Calculation',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _multiplier() {
    return Column(
      children: [
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Icon(Icons.close, color: Colors.orange[800], size: 18),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.black38,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}
