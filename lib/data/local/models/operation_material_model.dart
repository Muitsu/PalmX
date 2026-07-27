import 'package:palmx/core/local/database.dart';

class OperationMaterialModel extends OperationMaterialsTableData {
  OperationMaterialModel({
    super.id = 0,
    super.operationLogId = 0,
    super.materialType = '',
    super.materialQty = 0,
    super.materialRate = 0.0,
  });

  factory OperationMaterialModel.empty() => OperationMaterialModel();

  factory OperationMaterialModel.fromDrift(OperationMaterialsTableData data) {
    return OperationMaterialModel(
      id: data.id,
      operationLogId: data.operationLogId,
      materialType: data.materialType,
      materialQty: data.materialQty,
      materialRate: data.materialRate,
    );
  }

  double get totalCost => materialQty * materialRate;

  OperationMaterialModel copyData({
    String? materialType,
    int? materialQty,
    double? materialRate,
  }) {
    return OperationMaterialModel(
      id: id,
      operationLogId: operationLogId,
      materialType: materialType ?? this.materialType,
      materialQty: materialQty ?? this.materialQty,
      materialRate: materialRate ?? this.materialRate,
    );
  }
}
