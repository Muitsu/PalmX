import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:palmx/core/widgets/input_formatter/currency_input_formatter.dart';
import 'package:palmx/core/widgets/utils.dart';
import 'package:palmx/data/local/models/material_model.dart';
import 'package:palmx/features/operation/presentation/operation_log/dropdown_service.dart';
import 'package:palmx/features/operation/presentation/provider/operation_provider.dart';
import 'package:provider/provider.dart';

class MaterialCostSheet extends StatefulWidget {
  final ScrollController? sc;
  const MaterialCostSheet({super.key, this.sc});

  @override
  State<MaterialCostSheet> createState() => _MaterialCostSheetState();
}

class _MaterialRow {
  final TextEditingController typeCtrl;
  final TextEditingController qtyCtrl;
  final TextEditingController rateCtrl;
  MaterialModel? selectedMaterial;

  _MaterialRow({
    required String materialType,
    required int materialQty,
    required double materialRate,
  }) : typeCtrl = TextEditingController(text: materialType),
       qtyCtrl = TextEditingController(text: materialQty.toString()),
       rateCtrl = TextEditingController(text: materialRate.toStringAsFixed(2));

  void dispose() {
    typeCtrl.dispose();
    qtyCtrl.dispose();
    rateCtrl.dispose();
  }
}

class _MaterialCostSheetState extends State<MaterialCostSheet> {
  late OperationProvider _operationProvider;
  late List<_MaterialRow> _rows;

  @override
  void initState() {
    super.initState();
    _operationProvider = context.read<OperationProvider>();
    final materials = _operationProvider.currentOperation?.materials ?? [];
    _rows = materials
        .map(
          (m) => _MaterialRow(
            materialType: m.materialType,
            materialQty: m.materialQty,
            materialRate: m.materialRate,
          ),
        )
        .toList();
  }

  @override
  void dispose() {
    for (final row in _rows) {
      row.dispose();
    }
    super.dispose();
  }

  double _stringToDouble(String val) => double.tryParse(val) ?? 0.0;

  void _onSave(int index) {
    EasyDebounce.debounce("save-material-$index", const Duration(milliseconds: 500), () {
      _operationProvider.updateMaterial(
        index,
        materialType: _rows[index].typeCtrl.text,
        materialQty: int.tryParse(_rows[index].qtyCtrl.text) ?? 0,
        materialRate: _stringToDouble(_rows[index].rateCtrl.text),
      );
    });
  }

  void _addRow() {
    setState(() {
      _rows.add(
        _MaterialRow(materialType: '', materialQty: 0, materialRate: 0.0),
      );
    });
    _operationProvider.addMaterial();
  }

  void _removeRow(int index) {
    if (_rows.length <= 1) return;
    EasyDebounce.cancel("save-material-$index");
    setState(() {
      _rows.removeAt(index).dispose();
    });
    _operationProvider.removeMaterial(index);
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
                          'Add one or more materials used',
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

              // 3. Material rows
              for (var index = 0; index < _rows.length; index++)
                _buildMaterialRow(index)
                    .animate()
                    .fadeIn(delay: (150 + index * 80).ms)
                    .slideY(begin: 0.1, curve: Curves.easeOutCubic),

              _buildAddButton().animate().fadeIn(delay: 250.ms),

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

  Widget _buildMaterialRow(int index) {
    final row = _rows[index];
    return Container(
      key: ValueKey(row),
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.02),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'MATERIAL ${index + 1}',
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                    letterSpacing: 1.1,
                  ),
                ),
              ),
              if (_rows.length > 1)
                IconButton(
                  onPressed: () => _removeRow(index),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  visualDensity: VisualDensity.compact,
                  icon: const Icon(
                    Icons.delete_outline,
                    color: Colors.redAccent,
                    size: 20,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          buildTextField(
            ctrl: row.typeCtrl,
            label: "Material type",
            hint: "Choose material",
            isDropdown: true,
            onTap: () {
              DropdownService.showMaterial(
                context,
                initialValue: row.selectedMaterial,
                onSelected: (material) {
                  if (material == null) return;
                  setState(() {
                    row.selectedMaterial = material;
                    row.typeCtrl.text = material.name;
                    row.rateCtrl.text = material.price.toStringAsFixed(2);
                  });
                  _onSave(index);
                },
              );
            },
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: buildTextField(
                  label: 'Qty',
                  hint: "0",
                  ctrl: row.qtyCtrl,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (val) => _onSave(index),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Icon(Icons.close, color: Colors.orange[800], size: 18),
              ),
              Expanded(
                child: buildTextField(
                  label: 'Rate',
                  hint: "0.00",
                  ctrl: row.rateCtrl,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CurrencyInputFormatter(),
                  ],
                  onChanged: (val) => _onSave(index),
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
    );
  }

  Widget _buildAddButton() {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: _addRow,
        icon: Icon(Icons.add, color: Colors.orange[800]),
        label: Text(
          "Add another material",
          style: TextStyle(
            color: Colors.orange[800],
            fontWeight: FontWeight.bold,
          ),
        ),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          side: BorderSide(color: Colors.orange[800]!),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
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
                'RM${(pWatch.currentOperation?.materialTotalCost ?? 0.00).toStringAsFixed(2)}',
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
}
