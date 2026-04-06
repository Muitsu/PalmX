import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:palmx/core/widgets/input_formatter/currency_input_formatter.dart';
import 'package:palmx/core/widgets/utils.dart';

class SupervisionCostSheet extends StatefulWidget {
  final ScrollController? sc;
  const SupervisionCostSheet({super.key, this.sc});

  @override
  State<SupervisionCostSheet> createState() => _SupervisionCostSheetState();
}

class _SupervisionCostSheetState extends State<SupervisionCostSheet> {
  final mandaysController = TextEditingController(text: "12");
  final rateController = TextEditingController(text: "65.38");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          controller: widget.sc,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 1. Drag Handle
              Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 400.ms)
                  .scale(begin: const Offset(0.8, 1)),

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
                              'Supervision Cost',
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
                          backgroundColor: Colors.blueGrey.withValues(
                            alpha: 0.05,
                          ),
                        ),
                      ),
                    ],
                  )
                  .animate()
                  .fadeIn(duration: 400.ms, delay: 100.ms)
                  .slideX(begin: -0.1),

              const SizedBox(height: 16),

              // 3. Inputs Group
              Column(
                    children: [
                      // Mandays Input
                      buildTextField(
                        label: 'Mandays',
                        hint: '',
                        ctrl: mandaysController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                      ),

                      // Divider with "X" (Multiplication) - Custom Pop effect
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          children: [
                            const Expanded(
                              child: Divider(color: Colors.black12),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child:
                                  Icon(
                                        Icons.close,
                                        color: Colors.orange[800],
                                        size: 18,
                                      )
                                      .animate(delay: 600.ms)
                                      .scale(
                                        duration: 400.ms,
                                        curve: Curves.easeOutBack,
                                        begin: const Offset(0, 0),
                                      ),
                            ),
                            const Expanded(
                              child: Divider(color: Colors.black12),
                            ),
                          ],
                        ),
                      ),

                      // Fixed Rate Input
                      buildTextField(
                        label: 'Fixed Rate (Daily)',
                        hint: '',
                        ctrl: rateController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CurrencyInputFormatter(),
                        ],
                        textAlign: TextAlign.center,
                        prefixWidget: const Padding(
                          padding: EdgeInsets.only(top: 14, left: 10),
                          child: Text("RM "),
                        ),
                      ),
                    ],
                  )
                  .animate()
                  .fadeIn(duration: 500.ms, delay: 200.ms)
                  .slideY(begin: 0.05),

              const SizedBox(height: 24),
            ],
          ),
        ),
        // 4. Bottom Calculation & Action
        bottomNavigationBar: _bottomCalculationButton()
            .animate()
            .fadeIn(duration: 400.ms, delay: 400.ms)
            .slideY(begin: 0.2, curve: Curves.easeOutQuad),
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
                  )
                  .animate(delay: 800.ms)
                  .shimmer(
                    duration: 1500.ms,
                    color: Colors.orange.withValues(alpha: 0.4),
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
}
