import 'package:palmx/core/local/database.dart';

class OperationLogModel extends OperationLogsTableData {
  OperationLogModel({
    required super.id,
    required super.operationDate,
    required super.activityType,
    required super.field,
    required super.hectar,
    required super.mandays,
    super.remarks,
    required super.labourRate,
    required super.labourQty,
    required super.labourOtRate,
    required super.labourOtHour,
    required super.supervisionRate,
    required super.supervisionMandays,
    required super.driverRate,
    required super.driverTotal,
    required super.materialType,
    required super.materialQty,
    required super.materialLitreRate,
    required super.evitTime,
    required super.evitRate,
  });

  factory OperationLogModel.fromDrift(OperationLogsTableData data) {
    return OperationLogModel(
      id: data.id,
      operationDate: data.operationDate,
      activityType: data.activityType,
      field: data.field,
      hectar: data.hectar,
      mandays: data.mandays,
      remarks: data.remarks,
      labourRate: data.labourRate,
      labourQty: data.labourQty,
      labourOtRate: data.labourOtRate,
      labourOtHour: data.labourOtHour,
      supervisionRate: data.supervisionRate,
      supervisionMandays: data.supervisionMandays,
      driverRate: data.driverRate,
      driverTotal: data.driverTotal,
      materialType: data.materialType,
      materialQty: data.materialQty,
      materialLitreRate: data.materialLitreRate,
      evitTime: data.evitTime,
      evitRate: data.evitRate,
    );
  }

  //Labour calculation
  double get _normalLabourCost => ((labourRate * labourQty));
  double get _otLabourCost => ((labourOtHour * labourOtRate));
  double get labourTotalCost => (_normalLabourCost + _otLabourCost);

  double get supervisionTotalCost => (supervisionMandays * supervisionRate);

  double get driverTotalCost => (driverTotal * driverRate);

  double get materialTotalCost =>
      ((materialQty ?? 0) * (materialLitreRate ?? 0));

  double get evitTotalCost => ((evitRate ?? 0) * (evitTime ?? 0));

  double get totalAll =>
      labourTotalCost +
      supervisionTotalCost +
      driverTotalCost +
      materialTotalCost +
      evitTotalCost;
}
