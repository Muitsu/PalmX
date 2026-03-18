import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:palmx/core/widgets/input/custom_date_picker.dart';
import 'package:palmx/core/widgets/input/custom_dropdown_sheet.dart';
import 'package:palmx/core/widgets/input_formatter/currency_input_formatter.dart';
import 'package:palmx/core/widgets/modal/custom_draggable_sheet.dart';
import 'package:palmx/core/widgets/utils.dart';
import 'package:palmx/features/operation/cost_table/driver_cost_sheet.dart';
import 'package:palmx/features/operation/cost_table/evit_cost_sheet.dart';
import 'package:palmx/features/operation/cost_table/labour_cost_sheet.dart';
import 'package:palmx/features/operation/cost_table/material_cost_sheet.dart';
import 'package:palmx/features/operation/cost_table/supervision_cost_sheet.dart';

class OperationLogFormPage extends StatefulWidget {
  const OperationLogFormPage({super.key});

  @override
  State<OperationLogFormPage> createState() => _OperationLogFormPageState();
}

class _OperationLogFormPageState extends State<OperationLogFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,

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
            buildTextField(
              ctrl: null,
              prefixWidget: Icon(Icons.calendar_today_outlined),
              label: "Date",
              hint: "dd/mm/yyyy",
              isDropdown: true,
              onTap: () async {
                await CustomDatePicker.show(
                  context: context,
                  type: DatePickerType.single,
                );
              },
            ),
            const SizedBox(height: 10),
            //Dropdown
            buildTextField(
              ctrl: null,
              prefixWidget: Icon(Icons.shopping_bag_outlined),
              label: "Activity Type",
              hint: "Harvesting & Collection",
              isDropdown: true,
              onTap: () {
                CustomDropdownSheet.show<String>(
                  context,
                  label: "Activity",
                  accentColor: Colors.deepOrange,
                  items: ["A", "B", "C"],
                  groupValue: "A",
                  getTitle: (item) => item,
                  onChange: (item) {},
                );
              },
            ),
            const SizedBox(height: 10),
            //Dropdown
            buildTextField(
              ctrl: null,
              prefixWidget: Icon(Icons.location_on_outlined),
              label: "Field",
              hint: "Division A - Block 12",
              isDropdown: true,
              onTap: () {
                CustomDropdownSheet.show<String>(
                  context,
                  label: "Field",
                  accentColor: Colors.deepOrange,
                  items: ["A", "B", "C"],
                  groupValue: "A",
                  getTitle: (item) => item,
                  onChange: (item) {},
                );
              },
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: buildTextField(
                    ctrl: null,
                    prefixWidget: Icon(Icons.architecture_outlined),
                    label: "Ha today",
                    hint: "0.00",
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CurrencyInputFormatter(),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: buildTextField(
                    ctrl: null,
                    prefixWidget: Icon(Icons.group_outlined),
                    label: "Mandays",
                    hint: "0",
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            buildTextField(
              ctrl: null,
              prefixWidget: Icon(Icons.edit_note_outlined),
              label: "Remarks",
              hint: "Additional observations...",
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
          _costItem(
            "Labour cost",
            "12 workers x RM65.00",
            "780.00",
            onTap: () {
              CustomDraggableSheet.show(
                context: context,
                maxChildSize: .9,
                minChildSize: .6,
                initialChildSize: .85,
                builder: (_, sc) => LabourCostSheet(sc: sc),
              );
            },
          ),
          _costItem(
            "Supervision cost",
            "2 units x RM85.00",
            "170.00",
            onTap: () {
              CustomDraggableSheet.show(
                context: context,
                builder: (_, _) => SupervisionCostSheet(),
              );
            },
          ),
          _costItem(
            "Driver cost",
            "4 units x RM55.00",
            "220.00",
            onTap: () {
              CustomDraggableSheet.show(
                context: context,
                builder: (_, sc) => DriverCostSheet(sc: sc),
              );
            },
          ),
          _costItem(
            "Material cost",
            "50 bags x RM45.50",
            "2,275.00",
            onTap: () {
              CustomDraggableSheet.show(
                context: context,
                builder: (_, sc) => MaterialCostSheet(sc: sc),
              );
            },
          ),
          _costItem(
            "Evit cost",
            "System overhead 10%",
            "344.50",
            isLast: true,
            onTap: () {
              CustomDraggableSheet.show(
                context: context,
                builder: (_, sc) => EvitCostSheet(sc: sc),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _costItem(
    String title,
    String sub,
    String amount, {
    void Function()? onTap,
    bool isLast = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
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
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 11,
                        ),
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
      ),
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
