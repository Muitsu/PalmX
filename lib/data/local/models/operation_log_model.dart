import 'package:drift/drift.dart';
import 'package:palmx/core/local/database.dart';

class OperationLogModel extends OperationLogsTableData {
  OperationLogModel({
    required super.id,
    required super.operationDate,
    super.activityType,
    super.field,
    super.hectar,
    super.mt,
    super.mandays,
    super.remarks,
    super.labourRate = 0.0,
    super.labourQty = 0.0,
    super.labourOtRate = 0.0,
    super.labourOtHour = 0.0,
    super.labourPieceUnit = 0.0,
    super.labourPieceRate = 0.0,
    super.labourHarvestUnit = 0.0,
    super.labourHarvestRate = 0.0,
    super.supervisionRate = 0.0,
    super.supervisionMandays = 0.0,
    super.driverRate = 0.0,
    super.driverTotal = 0.0,
    super.materialType,
    super.materialQty = 0,
    super.materialLitreRate = 0.0,
    super.evitTime = 0,
    super.evitRate = 0.0,
  });

  factory OperationLogModel.fromDrift(OperationLogsTableData data) {
    return OperationLogModel(
      id: data.id,
      operationDate: data.operationDate,
      activityType: data.activityType,
      field: data.field,
      hectar: data.hectar,
      mt: data.mt,
      mandays: data.mandays,
      remarks: data.remarks,
      labourRate: data.labourRate,
      labourQty: data.labourQty,
      labourOtRate: data.labourOtRate,
      labourOtHour: data.labourOtHour,
      labourPieceUnit: data.labourPieceUnit,
      labourPieceRate: data.labourPieceRate,
      labourHarvestUnit: data.labourHarvestUnit,
      labourHarvestRate: data.labourHarvestRate,
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

  OperationLogModel copyData({
    int? id,
    DateTime? operationDate,
    String? activityType,
    String? field,
    double? hectar,
    double? mt,
    double? mandays,
    String? remarks,
    double? labourRate,
    double? labourQty,
    double? labourOtRate,
    double? labourOtHour,
    double? labourPieceUnit,
    double? labourPieceRate,
    double? labourHarvestUnit,
    double? labourHarvestRate,
    double? supervisionRate,
    double? supervisionMandays,
    double? driverRate,
    double? driverTotal,
    String? materialType,
    int? materialQty,
    double? materialLitreRate,
    double? evitTime,
    double? evitRate,
  }) {
    return OperationLogModel(
      id: id ?? this.id,
      operationDate: operationDate ?? this.operationDate,
      activityType: activityType ?? this.activityType,
      field: field ?? this.field,
      hectar: hectar ?? this.hectar,
      mt: mt ?? this.mt,
      mandays: mandays ?? this.mandays,
      remarks: remarks ?? this.remarks,
      labourRate: labourRate ?? this.labourRate,
      labourQty: labourQty ?? this.labourQty,
      labourOtRate: labourOtRate ?? this.labourOtRate,
      labourOtHour: labourOtHour ?? this.labourOtHour,
      labourPieceUnit: labourPieceUnit ?? this.labourPieceUnit,
      labourPieceRate: labourPieceRate ?? this.labourPieceRate,
      labourHarvestUnit: labourHarvestUnit ?? this.labourHarvestUnit,
      labourHarvestRate: labourHarvestRate ?? this.labourHarvestRate,
      supervisionRate: supervisionRate ?? this.supervisionRate,
      supervisionMandays:
          supervisionMandays ?? this.supervisionMandays, // Fixed here
      driverRate: driverRate ?? this.driverRate,
      driverTotal: driverTotal ?? this.driverTotal, // Fixed here
      materialType: materialType ?? this.materialType,
      materialQty: materialQty ?? this.materialQty, // Fixed here
      materialLitreRate:
          materialLitreRate ?? this.materialLitreRate, // Fixed here
      evitTime: evitTime ?? this.evitTime, // Fixed here
      evitRate: evitRate ?? this.evitRate, // Fixed here
    );
  }

  OperationLogsTableCompanion toInsert({required int? ids}) {
    return OperationLogsTableCompanion.insert(
      id: ids == null ? Value.absent() : Value(ids),
      operationDate: operationDate,
      activityType: Value(activityType),
      field: Value(field),
      hectar: Value(hectar),
      mt: Value(mt),
      mandays: Value(mandays),
      remarks: Value(remarks),
      labourRate: Value(labourRate),
      labourQty: Value(labourQty),
      labourOtRate: Value(labourOtRate),
      labourOtHour: Value(labourOtHour),
      labourPieceUnit: Value(labourPieceUnit),
      labourPieceRate: Value(labourPieceRate),
      labourHarvestUnit: Value(labourHarvestUnit),
      labourHarvestRate: Value(labourHarvestRate),
      supervisionRate: Value(supervisionRate),
      supervisionMandays: Value(supervisionMandays),
      driverRate: Value(driverRate),
      driverTotal: Value(driverTotal),
      materialType: Value(materialType),
      materialQty: Value(materialQty),
      materialLitreRate: Value(materialLitreRate),
      evitTime: Value(evitTime),
      evitRate: Value(evitRate),
    );
  }

  //Labour calculation
  //Basic
  double get _basicLabourCost => ((labourRate * labourQty));
  double get _basicOtLabourCost => ((labourOtHour * labourOtRate));
  double get totalBasicLabourCost => (_basicLabourCost + _basicOtLabourCost);
  //Piece Rate
  double get _pieceLabourCost => ((labourPieceUnit * labourPieceRate));
  //Harvesting Rate
  double get _harvestingLabourCost => ((labourHarvestUnit * labourHarvestRate));
  double get labourTotalCost =>
      (totalBasicLabourCost + _pieceLabourCost + _harvestingLabourCost);

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
