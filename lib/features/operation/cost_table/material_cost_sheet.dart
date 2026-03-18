import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart'; // Ensure this is imported
import 'package:palmx/core/widgets/input/custom_dropdown_sheet.dart';
import 'package:palmx/core/widgets/input_formatter/currency_input_formatter.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // 1. Drag Handle
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ).animate().fadeIn(duration: 300.ms).scaleY(begin: 0),

              const SizedBox(height: 20),

              // 2. Header
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
              ).animate().fadeIn(delay: 100.ms).slideX(begin: -0.1),

              const SizedBox(height: 16),

              // 3. Dropdown - Slightly more prominent entrance
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
                  )
                  .animate()
                  .fadeIn(delay: 200.ms)
                  .slideY(begin: 0.2, curve: Curves.easeOutBack),

              const SizedBox(height: 24),

              // 4. Labor Section row
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            CurrencyInputFormatter(),
                          ],
                          prefixWidget: const Padding(
                            padding: EdgeInsets.only(top: 14, left: 10),
                            child: Text("RM "),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ).animate().fadeIn(delay: 350.ms).slideY(begin: 0.1),

              const SizedBox(height: 24),
            ],
          ),
        ),
        // 5. Bottom Navigation
        bottomNavigationBar: _bottomCalculationButton()
            .animate()
            .fadeIn(delay: 500.ms)
            .slideY(begin: 0.3, curve: Curves.easeOutQuad),
      ),
    );
  }

  Widget _bottomCalculationButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Divider(color: Color(0xFFEEEEEE), thickness: 1),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Cost',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A233A),
                ),
              ),
              Text(
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
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange[800],
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
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Icon(Icons.close, color: Colors.orange[800], size: 18),
        ),
      ],
    ).animate(delay: 700.ms).scale(curve: Curves.elasticOut);
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
