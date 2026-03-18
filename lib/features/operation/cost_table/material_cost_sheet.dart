import 'package:flutter/material.dart';
import 'package:palmx/core/widgets/input/custom_dropdown_sheet.dart';
import 'package:palmx/core/widgets/utils.dart';

class MaterialCostSheet extends StatefulWidget {
  final ScrollController? sc;
  const MaterialCostSheet({super.key, this.sc});

  @override
  State<MaterialCostSheet> createState() => _MaterialCostSheetState();
}

class _MaterialCostSheetState extends State<MaterialCostSheet> {
  final materialTypeController = TextEditingController(text: "");
  final materialCostController = TextEditingController(text: "65.38");
  final materialQtyController = TextEditingController(text: "12");

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
              // Drag Handle
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

              // Header Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Material Cost',
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
              const SizedBox(height: 16),
              //Dropdown
              buildTextField(
                ctrl: materialTypeController,
                label: "Material type",
                hint: "Choose material",
                isDropdown: true,
                onTap: () {
                  CustomDropdownSheet.show<String>(
                    context,
                    label: "Material type",
                    accentColor: Colors.deepOrange,
                    items: ["A", "B", "C"],
                    groupValue: "A",
                    getTitle: (item) => item,
                    onChange: (item) {},
                  );
                },
              ),
              const SizedBox(height: 24),
              // Basic Labor Section
              _buildSectionHeader('BASIC LABOR'),
              Row(
                children: [
                  Expanded(
                    child: buildTextField(
                      label: 'Material Qty',
                      hint: "",
                      ctrl: materialQtyController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  _multiplier(),
                  Expanded(
                    child: buildTextField(
                      label: 'Material cost (Litre)',
                      hint: "",
                      ctrl: materialCostController,
                      prefixWidget: Padding(
                        padding: const EdgeInsets.only(top: 14, left: 10),
                        child: Text("RM "),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
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
