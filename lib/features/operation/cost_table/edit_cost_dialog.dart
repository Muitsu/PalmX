import 'package:flutter/material.dart';

void showEditCostDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF4ED),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.edit_outlined,
                      color: Colors.orange[800],
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    "Edit Cost Calculation",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A2B47),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "You are about to modify the calculation for this item. This will update the total operation cost.",
                style: TextStyle(
                  color: Colors.blueGrey,
                  height: 1.5,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 24),

              // Labour Cost Input
              _buildLabel("LABOUR COST DETAILS"),
              _buildDialogField(
                icon: Icons.group_outlined,
                value: "12 workers x RM65.00",
                textColor: Colors.black87,
              ),

              const SizedBox(height: 16),

              // Total Amount Input
              _buildLabel("TOTAL AMOUNT (RM)"),
              _buildDialogField(
                icon: Icons.payments_outlined,
                value: "780.00",
                textColor: Colors.orange[800]!,
                fontWeight: FontWeight.bold,
              ),

              const SizedBox(height: 32),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: BorderSide(color: Colors.grey.shade200),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          color: Color(0xFF1A2B47),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange[900],
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Update Cost",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

// --- Helper Widgets ---

Widget _buildLabel(String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Text(
      text,
      style: const TextStyle(
        color: Color(0xFF7B8794),
        fontSize: 11,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.5,
      ),
    ),
  );
}

Widget _buildDialogField({
  required IconData icon,
  required String value,
  required Color textColor,
  FontWeight fontWeight = FontWeight.normal,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    decoration: BoxDecoration(
      color: const Color(0xFFFFFAF7),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: const Color(0xFFFBE8DB)),
    ),
    child: Row(
      children: [
        Icon(icon, color: Colors.blueGrey[300], size: 20),
        const SizedBox(width: 12),
        Text(
          value,
          style: TextStyle(
            color: textColor,
            fontSize: 15,
            fontWeight: fontWeight,
          ),
        ),
      ],
    ),
  );
}
