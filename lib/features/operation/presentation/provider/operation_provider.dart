import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:palmx/core/externsions/datetime_extension.dart';
import 'package:palmx/core/widgets/input/custom_date_picker.dart';
import 'package:palmx/data/local/models/activity_model.dart';
import 'package:palmx/data/local/models/field_model.dart';
import 'package:palmx/data/local/models/operation_log_model.dart';
import 'package:palmx/features/calendar/provider/calendar_provider.dart';
import 'package:palmx/features/operation/domain/usecase/save_operation.dart';
import 'package:provider/provider.dart';

@injectable
class OperationProvider extends ChangeNotifier {
  SaveOperation saveOperation;
  OperationProvider(this.saveOperation);

  OperationLogModel? _currentOperation;
  OperationLogModel? get currentOperation => _currentOperation;
  ActivityModel? selectedActivity;
  FieldModel? selectedField;

  late TextEditingController dateCtrl;

  late TextEditingController acitivityCtrl;
  late TextEditingController fieldCtrl;
  late TextEditingController haTodayCtrl;
  late TextEditingController haAvrgCtrl;
  late TextEditingController mtTodayCtrl;
  late TextEditingController mtAvrgCtrl;
  late TextEditingController mandaysCtrl;
  late TextEditingController remarksCtrl;
  final formKey = GlobalKey<FormState>();
  bool isUpdate = false;
  void init({OperationLogModel? operationData, DateTime? date}) {
    final defaultDate = date ?? DateTime.now();
    isUpdate = operationData != null;
    _currentOperation =
        operationData ?? OperationLogModel(id: 0, operationDate: defaultDate);
    dateCtrl = TextEditingController(text: defaultDate.previewDate());

    acitivityCtrl = TextEditingController(text: operationData?.activityType);
    fieldCtrl = TextEditingController(text: operationData?.field);
    //Mandays
    mandaysCtrl = TextEditingController(
      text: operationData?.mandays?.toString() ?? '0',
    );
    //HA Today
    haTodayCtrl = TextEditingController(
      text: operationData?.hectar?.toString() ?? '0',
    );
    haAvrgCtrl = TextEditingController(text: _calcHaAvrg());
    //HA Today Avrg = HA Today / Mandays
    haTodayCtrl.addListener(() {
      haAvrgCtrl.text = _calcHaAvrg();
      notifyListeners();
    });
    //MT Today
    mtTodayCtrl = TextEditingController(
      text: operationData?.mt?.toString() ?? '0',
    );
    mtAvrgCtrl = TextEditingController(text: _calcMtAvrg());
    //Mt Today Avrg = Mt Today / Mandays
    mtTodayCtrl.addListener(() {
      mtAvrgCtrl.text = _calcMtAvrg();
      notifyListeners();
    });

    remarksCtrl = TextEditingController(text: operationData?.remarks);

    WidgetsBinding.instance.addPostFrameCallback((_) => notifyListeners());
  }

  String _calcHaAvrg() {
    final ha = _stringToDouble(haTodayCtrl.text);
    final man = _stringToDouble(mandaysCtrl.text);
    return _safeDivide(ha, man);
  }

  String _calcMtAvrg() {
    final mt = _stringToDouble(mtTodayCtrl.text);
    final man = _stringToDouble(mandaysCtrl.text);
    return _safeDivide(mt, man);
  }

  String _safeDivide(double numerator, double denominator) {
    if (denominator == 0) return "0"; // Quick exit for divide by zero

    final result = numerator / denominator;

    // Check if the result is invalid (NaN or Infinity)
    if (result.isNaN || result.isInfinite) {
      return "0";
    }

    return result.toString();
  }

  void clear() {
    selectedActivity = null;
    selectedField = null;
    _currentOperation = null;
    dateCtrl.dispose();
    acitivityCtrl.dispose();
    fieldCtrl.dispose();
    haTodayCtrl.dispose();
    haAvrgCtrl.dispose();
    mtTodayCtrl.dispose();
    mtAvrgCtrl.dispose();
    mandaysCtrl.dispose();
    remarksCtrl.dispose();
  }

  Future<void> setDate(BuildContext context) async {
    final result = await CustomDatePicker.show(
      context: context,
      initialDate: currentOperation?.operationDate,
      type: DatePickerType.single,
    );
    final date = result?.singleDate;
    if (date == null) return;
    _currentOperation = _currentOperation!.copyData(operationDate: date);
    dateCtrl.text = date.previewDate();
    notifyListeners();
  }

  void setActivityType(ActivityModel? val) {
    if (val == null) return;
    _currentOperation = _currentOperation!.copyData(activityType: val.name);
    acitivityCtrl.text = val.name ?? "";
    selectedActivity = val;
    notifyListeners();
  }

  void setField(FieldModel? val) {
    if (val == null) return;
    _currentOperation = _currentOperation!.copyData(field: val.name);
    fieldCtrl.text = val.name;
    selectedField = val;
    notifyListeners();
  }

  void setHaToday(double val) {
    _currentOperation = _currentOperation!.copyData(hectar: val);
    notifyListeners();
  }

  void setMandays(double val) {
    _currentOperation = _currentOperation!.copyData(mandays: val);
    notifyListeners();
  }

  void setRemarks(String val) {
    _currentOperation = _currentOperation!.copyData(remarks: val);
    notifyListeners();
  }

  void setLabourCost({
    double? labourOtHour,
    double? labourOtRate,
    double? labourRate,
    double? labourQty,
    double? labourPieceUnit,
    double? labourPieceRate,
    double? labourHarvestUnit,
    double? labourHarvestRate,
  }) {
    _currentOperation = _currentOperation!.copyData(
      labourRate: labourRate,
      labourQty: labourQty,
      labourOtHour: labourOtHour,
      labourOtRate: labourOtRate,
      labourPieceUnit: labourPieceUnit,
      labourPieceRate: labourPieceRate,
      labourHarvestUnit: labourHarvestUnit,
      labourHarvestRate: labourHarvestRate,
    );
    notifyListeners();
  }

  void setSupervisionCost({
    double? supervisionMandays,
    double? supervisionRate,
  }) {
    _currentOperation = _currentOperation!.copyData(
      supervisionMandays: supervisionMandays,
      supervisionRate: supervisionRate,
    );
    notifyListeners();
  }

  void setDriverCost({double? driverRate, double? driverTotal}) {
    _currentOperation = _currentOperation!.copyData(
      driverRate: driverRate,
      driverTotal: driverTotal,
    );
    notifyListeners();
  }

  void setMaterialCost({
    String? materialType,
    int? materialQty,
    double? materialLitreRate,
  }) {
    _currentOperation = _currentOperation!.copyData(
      materialType: materialType,
      materialQty: materialQty,
      materialLitreRate: materialLitreRate,
    );
    notifyListeners();
  }

  void setEvitCost({double? evitRate, double? evitTime}) {
    _currentOperation = _currentOperation!.copyData(
      evitRate: evitRate,
      evitTime: evitTime,
    );
    notifyListeners();
  }

  double _stringToDouble(String val) => double.tryParse(val) ?? 0.00;
  Future<bool> submit(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return false;
    }
    _currentOperation = _currentOperation!.copyData(
      hectar: _stringToDouble(haTodayCtrl.text),
      mt: _stringToDouble(mtTodayCtrl.text),
      mandays: _stringToDouble(mandaysCtrl.text),
      remarks: remarksCtrl.text,
    );
    final results = await saveOperation.call(
      entry: _currentOperation!.toInsert(
        ids: isUpdate ? _currentOperation!.id : null,
      ),
    );
    bool success = false;
    results.fold(
      (l) {
        dev.log("Error saving operation: ${l.message}");
      },
      (r) {
        dev.log("Operation saved with ID: $r");
        success = true;
      },
    );
    if (success) {
      if (!context.mounted) return false;
      context.read<CalendarProvider>().setViewData(data: _currentOperation!);
      context.read<CalendarProvider>().refresh();
    }
    return success;
  }
}
