import 'package:drift/drift.dart';

class OperationLogsTable extends Table {
  IntColumn get id => integer().autoIncrement()(); // Primary key

  DateTimeColumn get operationDate => dateTime()();
  TextColumn get activityType => text().nullable()();
  TextColumn get field => text().nullable()();
  RealColumn get hectar => real().nullable()();
  RealColumn get hectarToDate => real().nullable()();
  RealColumn get mandays => real().nullable()();
  TextColumn get remarks => text().nullable()();
  // Labour details
  RealColumn get labourRate => real().withDefault(const Constant(0.00))();
  RealColumn get labourQty => real().withDefault(const Constant(0.00))();
  RealColumn get labourOtHour => real().withDefault(const Constant(0.00))();
  RealColumn get labourOtRate => real().withDefault(const Constant(0.00))();
  RealColumn get labourPieceUnit => real().withDefault(const Constant(0.00))();
  RealColumn get labourPieceRate => real().withDefault(const Constant(0.00))();
  RealColumn get labourHarvestUnit =>
      real().withDefault(const Constant(0.00))();
  RealColumn get labourHarvestRate =>
      real().withDefault(const Constant(0.00))();

  // Supervision and Driver
  RealColumn get supervisionRate => real().withDefault(const Constant(70.38))();
  RealColumn get supervisionMandays =>
      real().withDefault(const Constant(0.00))();
  RealColumn get driverRate => real().withDefault(const Constant(70.38))();
  RealColumn get driverTotal => real().withDefault(const Constant(0.00))();

  // Materials
  TextColumn get materialType => text().nullable()();
  IntColumn get materialQty => integer().nullable()();
  RealColumn get materialLitreRate => real().nullable()();

  // Evit
  RealColumn get evitTime =>
      real().nullable().withDefault(const Constant(0.00))();
  RealColumn get evitRate =>
      real().nullable().withDefault(const Constant(0.00))();
}
