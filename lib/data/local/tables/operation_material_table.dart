import 'package:drift/drift.dart';
import 'package:palmx/data/local/tables/operation_logs_table.dart';

class OperationMaterialsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get operationLogId => integer()
      .references(OperationLogsTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get materialType => text().withDefault(const Constant(''))();
  IntColumn get materialQty => integer().withDefault(const Constant(0))();
  RealColumn get materialRate => real().withDefault(const Constant(0.00))();
}
