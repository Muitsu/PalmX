import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:palmx/core/widgets/utils.dart';
import 'package:palmx/features/operation/presentation/provider/operation_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/input_formatter/currency_input_formatter.dart';

class LabourCostSheet extends StatefulWidget {
  final ScrollController? sc;
  const LabourCostSheet({super.key, this.sc});

  @override
  State<LabourCostSheet> createState() => _LabourCostSheetState();
}

class _LabourCostSheetState extends State<LabourCostSheet> {
  late OperationProvider _operationProvider;

  late TextEditingController mandaysCtrl;
  late TextEditingController basicRateCtrl;
  late TextEditingController otHoursCtrl;
  late TextEditingController otRateCtrl;
  late TextEditingController quantityCtrl;
  late TextEditingController unitRateCtrl;
  @override
  void initState() {
    super.initState();

    _operationProvider = context.read<OperationProvider>();

    mandaysCtrl = TextEditingController(text: "0");
    basicRateCtrl = TextEditingController(text: "0.00");
    otHoursCtrl = TextEditingController(text: "0");
    otRateCtrl = TextEditingController(text: "0.00");
    quantityCtrl = TextEditingController(text: "0");
    unitRateCtrl = TextEditingController(text: "0.00");
  }

  @override
  void dispose() {
    super.dispose();
    mandaysCtrl.dispose();
    basicRateCtrl.dispose();
    otHoursCtrl.dispose();
    otRateCtrl.dispose();
    quantityCtrl.dispose();
    unitRateCtrl.dispose();
  }

  double _stringToDouble(String val) => double.tryParse(val) ?? 0.0;

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
              ).animate().fadeIn().scaleY(begin: 0),

              const SizedBox(height: 20),

              // 2. Header Row
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
              ).animate().fadeIn(duration: 400.ms).slideX(begin: -0.05),

              const SizedBox(height: 32),

              // 3. Staggered Sections
              // Basic Labor Section
              _buildAnimatedSection(
                delay: 100.ms,
                title: 'BASIC LABOR',
                child: Row(
                  children: [
                    Expanded(
                      child: buildTextField(
                        label: 'Mandays',
                        hint: "",
                        ctrl: mandaysCtrl,
                        readOnly: true,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CurrencyInputFormatter(),
                        ],
                        textAlign: TextAlign.center,
                      ),
                    ),
                    _multiplier(),
                    Expanded(
                      child: buildTextField(
                        label: 'Rate (Flat)',
                        hint: "",
                        ctrl: basicRateCtrl,
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
              ),

              const SizedBox(height: 24),

              // Overtime Section
              _buildAnimatedSection(
                delay: 250.ms,
                title: 'OVERTIME',
                child: Row(
                  children: [
                    Expanded(
                      child: buildTextField(
                        label: 'Hours',
                        hint: "",
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CurrencyInputFormatter(),
                        ],
                        ctrl: otHoursCtrl,
                      ),
                    ),
                    _multiplier(),
                    Expanded(
                      child: buildTextField(
                        label: 'OT Rate',
                        hint: "",
                        ctrl: otRateCtrl,
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
              ),

              const SizedBox(height: 24),

              // Output Based Section
              _buildAnimatedSection(
                delay: 400.ms,
                title: 'PIECE RATE',
                child: Row(
                  children: [
                    Expanded(
                      child: buildTextField(
                        label: 'Quantity',
                        hint: "",
                        ctrl: quantityCtrl,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    _multiplier(),
                    Expanded(
                      child: buildTextField(
                        label: 'Unit Rate',
                        hint: "",
                        ctrl: unitRateCtrl,
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
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
        // 4. Bottom Button
        bottomNavigationBar: _bottomCalculationButton()
            .animate()
            .fadeIn(delay: 600.ms)
            .slideY(begin: 0.1),
      ),
    );
  }

  // Helper to wrap sections in animation logic
  Widget _buildAnimatedSection({
    required Duration delay,
    required String title,
    required Widget child,
  }) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_buildSectionHeader(title), child],
        )
        .animate()
        .fadeIn(delay: delay, duration: 400.ms)
        .slideY(begin: 0.05, curve: Curves.easeOut);
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
              onPressed: () {
                _operationProvider.setLabourCost(
                  labourOtHour: _stringToDouble(otHoursCtrl.text),
                  labourOtRate: _stringToDouble(otRateCtrl.text),
                  labourRate: _stringToDouble(otHoursCtrl.text),
                  labourQty: _stringToDouble(otHoursCtrl.text),
                );
              },
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
    ).animate(delay: 800.ms).scale(duration: 300.ms, curve: Curves.elasticOut);
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
