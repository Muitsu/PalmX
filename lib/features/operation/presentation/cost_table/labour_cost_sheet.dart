import 'package:easy_debounce/easy_debounce.dart';
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

  late TextEditingController labourRateCtrl;
  late TextEditingController labourWorkerCtrl;
  late TextEditingController otHoursCtrl;
  late TextEditingController otRateCtrl;
  late TextEditingController pieceUnitCtrl;
  late TextEditingController pieceRateCtrl;
  late TextEditingController harvestUnitCtrl;
  late TextEditingController harvestRateCtrl;
  @override
  void initState() {
    super.initState();

    _operationProvider = context.read<OperationProvider>();
    final data = _operationProvider.currentOperation;
    labourWorkerCtrl = TextEditingController(
      text: data?.labourQty.toString() ?? "0",
    );
    labourRateCtrl = TextEditingController(
      text: data?.labourRate.toString() ?? "0.00",
    );
    otHoursCtrl = TextEditingController(
      text: data?.labourOtHour.toString() ?? "0",
    );
    otRateCtrl = TextEditingController(
      text: data?.labourOtRate.toString() ?? "0.00",
    );
    pieceUnitCtrl = TextEditingController(
      text: data?.labourPieceUnit.toString() ?? "0",
    );
    pieceRateCtrl = TextEditingController(
      text: data?.labourPieceRate.toString() ?? "0.00",
    );
    harvestUnitCtrl = TextEditingController(
      text: data?.labourHarvestUnit.toString() ?? "0",
    );
    harvestRateCtrl = TextEditingController(
      text: data?.labourHarvestRate.toString() ?? "0.00",
    );
  }

  @override
  void dispose() {
    super.dispose();
    labourRateCtrl.dispose();
    labourWorkerCtrl.dispose();
    otHoursCtrl.dispose();
    otRateCtrl.dispose();
    pieceUnitCtrl.dispose();
    pieceRateCtrl.dispose();
    harvestUnitCtrl.dispose();
    harvestRateCtrl.dispose();
  }

  double _stringToDouble(String val) => double.tryParse(val) ?? 0.0;
  void _onSave() {
    EasyDebounce.debounce(
      "save-data",
      Duration(milliseconds: 500), // <-- The debounce duration
      () {
        _operationProvider.setLabourCost(
          labourRate: _stringToDouble(labourRateCtrl.text),
          labourQty: _stringToDouble(labourWorkerCtrl.text),
          labourOtHour: _stringToDouble(labourRateCtrl.text),
          labourOtRate: _stringToDouble(labourWorkerCtrl.text),
          labourPieceUnit: _stringToDouble(pieceUnitCtrl.text),
          labourPieceRate: _stringToDouble(pieceRateCtrl.text),
          labourHarvestUnit: _stringToDouble(harvestUnitCtrl.text),
          labourHarvestRate: _stringToDouble(harvestRateCtrl.text),
        );
      },
    );
  }

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
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: buildTextField(
                            label: 'Mandays',
                            hint: "",
                            ctrl: labourRateCtrl,
                            onChanged: (val) {
                              _onSave();
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        _multiplier(),
                        Expanded(
                          child: buildTextField(
                            label: 'Rate (Flat)',
                            hint: "",
                            ctrl: labourWorkerCtrl,
                            onChanged: (val) {
                              _onSave();
                            },
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
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: buildTextField(
                            label: 'OT Hours',
                            hint: "",
                            ctrl: otHoursCtrl,
                            onChanged: (val) {
                              _onSave();
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        _multiplier(),
                        Expanded(
                          child: buildTextField(
                            label: 'OT Rate (Flat)',
                            hint: "",
                            ctrl: otRateCtrl,
                            onChanged: (val) {
                              _onSave();
                            },
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
                ),
              ),

              const SizedBox(height: 24),

              // Overtime Section
              _buildAnimatedSection(
                delay: 250.ms,
                title: 'PIECE RARED',
                child: Row(
                  children: [
                    Expanded(
                      child: buildTextField(
                        label: 'Unit',
                        hint: "",
                        textAlign: TextAlign.center,
                        onChanged: (val) {
                          _onSave();
                        },
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        ctrl: pieceUnitCtrl,
                      ),
                    ),
                    _multiplier(),
                    Expanded(
                      child: buildTextField(
                        label: 'Rate',
                        hint: "",
                        ctrl: pieceRateCtrl,
                        onChanged: (val) {
                          _onSave();
                        },
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
                title: 'HARVESTING RATE',
                child: Row(
                  children: [
                    Expanded(
                      child: buildTextField(
                        label: 'Total Unit',
                        hint: "",
                        onChanged: (val) {
                          _onSave();
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        ctrl: harvestUnitCtrl,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    _multiplier(),
                    Expanded(
                      child: buildTextField(
                        label: 'Unit Rate',
                        hint: "",
                        ctrl: harvestRateCtrl,
                        onChanged: (val) {
                          _onSave();
                        },
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
    final pWatch = context.watch<OperationProvider>();
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Divider(color: Color(0xFFEEEEEE), thickness: 1),
          ),
          Row(
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
                'RM${pWatch.currentOperation?.labourTotalCost ?? 0.00}',
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
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange[800],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Done',
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
