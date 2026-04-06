import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:palmx/data/local/models/activity_model.dart';
import 'package:palmx/data/local/models/field_model.dart';
import 'package:palmx/data/local/models/operation_log_model.dart';
import 'package:palmx/features/operation/domain/usecase/save_operation.dart';

@injectable
class OperationProvider extends ChangeNotifier {
  SaveOperation saveOperation;
  OperationProvider(this.saveOperation);

  OperationLogModel? _currentOperation;
  OperationLogModel? get currentOperation => _currentOperation;
  ActivityModel? selectedActivity;
  FieldModel? selectedField;

  void init() {
    _currentOperation = OperationLogModel(id: 0, operationDate: DateTime.now());
    WidgetsBinding.instance.addPostFrameCallback((_) => notifyListeners());
  }

  void clear() {
    _currentOperation = null;
  }

  void setDate(DateTime? val) {
    _currentOperation = _currentOperation!.copyData(operationDate: val);
    notifyListeners();
  }

  void setActivityType(ActivityModel? val) {
    if (val == null) return;
    _currentOperation = _currentOperation!.copyData(activityType: val.name);
    selectedActivity = val;
    notifyListeners();
  }

  void setField(FieldModel? val) {
    if (val == null) return;
    _currentOperation = _currentOperation!.copyData(field: val.name);
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
  }) {
    _currentOperation = _currentOperation!.copyData(
      labourOtHour: labourOtHour,
      labourOtRate: labourOtRate,
      labourRate: labourRate,
      labourQty: labourQty,
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
}
