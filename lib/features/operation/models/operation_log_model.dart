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
    required super.labourOtHour,
    required super.labourOtRate,
    required super.labourPieceQty,
    required super.labourPieceRate,
    required super.supervisionRate,
    required super.driverRate,
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
      labourOtHour: data.labourOtHour,
      labourOtRate: data.labourOtRate,
      labourPieceQty: data.labourPieceQty,
      labourPieceRate: data.labourPieceRate,
      supervisionRate: data.supervisionRate,
      driverRate: data.driverRate,
      materialType: data.materialType,
      materialQty: data.materialQty,
      materialLitreRate: data.materialLitreRate,
      evitTime: data.evitTime,
      evitRate: data.evitRate,
    );
  }

  double get labourTotalCost =>
      ((mandays * labourOtRate) +
      (labourOtHour * labourOtRate) +
      (labourPieceQty * labourPieceRate));

  double get supervisionTotalCost => (mandays * supervisionRate);

  double get driverTotalCost => (mandays * driverRate);

  double get materialTotalCost => (materialQty * materialLitreRate);

  double get evitTotalCost => (evitRate * evitTime);

  double get totalAll =>
      labourTotalCost +
      supervisionTotalCost +
      driverTotalCost +
      materialTotalCost +
      evitTotalCost;
}
