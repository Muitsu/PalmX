import 'package:flutter/material.dart';
import 'package:palmx/core/widgets/utils.dart';

class EvitCostSheet extends StatefulWidget {
  final ScrollController? sc;
  const EvitCostSheet({super.key, this.sc});

  @override
  State<EvitCostSheet> createState() => _EvitCostSheetState();
}

class _EvitCostSheetState extends State<EvitCostSheet> {
  final workingHoursController = TextEditingController(text: "7.5");
  final rateController = TextEditingController(text: "65.38");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          controller: widget.sc,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Drag Handle
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
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
                          'Evit Cost',
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

              // Mandays Input
              buildTextField(
                label: 'Working Time (hours)',
                hint: '1',
                ctrl: workingHoursController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
              ),

              // Divider with "X" (Multiplication)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    const Expanded(child: Divider(color: Colors.black12)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Icon(
                        Icons.close,
                        color: Colors.orange[800],
                        size: 18,
                      ),
                    ),
                    const Expanded(child: Divider(color: Colors.black12)),
                  ],
                ),
              ),

              // Fixed Rate Input
              buildTextField(
                label: 'Rate',
                hint: '',
                ctrl: rateController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                prefixWidget: Padding(
                  padding: const EdgeInsets.only(top: 14, left: 10),
                  child: Text("RM "),
                ),
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
}
