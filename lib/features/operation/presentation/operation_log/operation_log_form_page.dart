import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:palmx/core/widgets/input_formatter/currency_input_formatter.dart';
import 'package:palmx/core/widgets/modal/custom_draggable_sheet.dart';
import 'package:palmx/core/widgets/utils.dart';
import 'package:palmx/data/local/models/operation_log_model.dart';
import 'package:palmx/features/operation/presentation/cost_table/driver_cost_sheet.dart';
import 'package:palmx/features/operation/presentation/cost_table/evit_cost_sheet.dart';
import 'package:palmx/features/operation/presentation/cost_table/labour_cost_sheet.dart';
import 'package:palmx/features/operation/presentation/cost_table/material_cost_sheet.dart';
import 'package:palmx/features/operation/presentation/cost_table/supervision_cost_sheet.dart';
import 'package:palmx/features/operation/presentation/operation_log/dropdown_service.dart';
import 'package:palmx/features/operation/presentation/provider/operation_provider.dart';
import 'package:provider/provider.dart';

class OperationLogFormPage extends StatefulWidget {
  final DateTime? date;
  final OperationLogModel? operationData;
  const OperationLogFormPage({super.key, this.date, this.operationData});

  @override
  State<OperationLogFormPage> createState() => _OperationLogFormPageState();
}

class _OperationLogFormPageState extends State<OperationLogFormPage> {
  late OperationProvider _operationProvider;

  @override
  void initState() {
    super.initState();
    _operationProvider = context.read<OperationProvider>();
    _operationProvider.init(
      date: widget.date,
      operationData: widget.operationData,
    );
  }

  @override
  void dispose() {
    _operationProvider.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<OperationProvider>();
    final formKey = provider.formKey;

    return Form(
      key: formKey,
      child: Scaffold(
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
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTextField(
                  ctrl: _operationProvider.dateCtrl,
                  prefixWidget: Icon(Icons.calendar_today_outlined),
                  label: "Date",
                  hint: "Choose date",
                  isDropdown: true,
                  validator: (val) =>
                      val == null || val.isEmpty ? "Please choose date" : null,
                  onTap: () async {
                    _operationProvider.setDate(context);
                  },
                ),
                const SizedBox(height: 10),
                //Dropdown
                buildTextField(
                  ctrl: _operationProvider.acitivityCtrl,
                  prefixWidget: Icon(Icons.shopping_bag_outlined),
                  label: "Activity Type",
                  hint: "Harvesting & Collection",
                  validator: (val) => val == null || val.isEmpty
                      ? "Please choose activity"
                      : null,
                  isDropdown: true,
                  onTap: () {
                    DropdownService.showActivity(
                      context,
                      initialValue: provider.selectedActivity,
                      onSelected: (item) {
                        _operationProvider.setActivityType(item);
                      },
                    );
                  },
                ),
                const SizedBox(height: 10),
                //Dropdown
                buildTextField(
                  ctrl: _operationProvider.fieldCtrl,
                  prefixWidget: Icon(Icons.location_on_outlined),
                  label: "Field",
                  hint: "Division A - Block 12",
                  validator: (val) =>
                      val == null || val.isEmpty ? "Please choose field" : null,
                  isDropdown: true,
                  onTap: () {
                    DropdownService.showField(
                      context,
                      initialValue: provider.selectedField,
                      onSelected: (item) {
                        _operationProvider.setField(item);
                      },
                    );
                  },
                ),
                const SizedBox(height: 10),
                buildTextField(
                  ctrl: _operationProvider.mandaysCtrl,
                  prefixWidget: Icon(Icons.group_outlined),
                  label: "Mandays",
                  hint: "0",
                  validator: (val) => val == null || val.isEmpty
                      ? "Please choose mandays"
                      : null,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: buildTextField(
                          ctrl: _operationProvider.haTodayCtrl,
                          prefixWidget: Icon(Icons.architecture_outlined),
                          label: "Ha today",
                          hint: "0.00",
                          validator: (val) => val == null || val.isEmpty
                              ? "Please choose ha today"
                              : null,
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
                          ctrl: _operationProvider.haAvrgCtrl,
                          prefixWidget: Icon(Icons.percent),
                          label: "Avrg Hectar",
                          hint: "0",
                          readOnly: true,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: buildTextField(
                          ctrl: _operationProvider.mtTodayCtrl,
                          prefixWidget: Icon(Icons.architecture_outlined),
                          label: "Mt today",
                          hint: "0.00",
                          validator: (val) => val == null || val.isEmpty
                              ? "Please choose ha today"
                              : null,
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
                          ctrl: _operationProvider.mtAvrgCtrl,
                          prefixWidget: Icon(Icons.percent),
                          label: "Avrg Mt",
                          hint: "0",
                          readOnly: true,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                buildTextField(
                  ctrl: _operationProvider.remarksCtrl,
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
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
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
        ),
      ),
    );
  }

  Widget _buildCostSummaryCard() {
    final pWatch = context.watch<OperationProvider>();
    final data = pWatch.currentOperation;
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
            (data?.labourTotalCost ?? 0.00).toStringAsFixed(2),
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
            (data?.supervisionTotalCost ?? 0.00).toStringAsFixed(2),
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
            (data?.driverTotalCost ?? 0.00).toStringAsFixed(2),
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
            (data?.materialTotalCost ?? 0.00).toStringAsFixed(2),
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
            (data?.evitTotalCost ?? 0.00).toStringAsFixed(2),
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
    final pWatch = context.watch<OperationProvider>();
    final data = pWatch.currentOperation;
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
          "RM ${(data?.totalAll ?? 0.00).toStringAsFixed(2)}",
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
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _metricCard("COST / HA", "RM 473"),
        SizedBox(width: 16),
        _metricCard("COST / MT", "RM 15.2"),
        // _metricCard("COST / PALM", "RM 3.40"),
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
        onPressed: () {
          _operationProvider.submit(context).then((success) {
            if (success) {
              showSuccess(
                // ignore: use_build_context_synchronously
                context,
                message: "Operation log submitted successfully!",
              );
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            } else {
              showError(
                // ignore: use_build_context_synchronously
                context,
                message: "Failed to submit operation log.",
              );
            }
          });
        },
        icon: const Icon(Icons.send_rounded, color: Colors.white),
        label: Text(
          widget.operationData == null ? "Submit Log" : "Update Log",
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
