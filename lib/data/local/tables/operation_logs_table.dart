import 'package:drift/drift.dart';

class OperationLogsTable extends Table {
  IntColumn get id => integer().autoIncrement()(); // Primary key

  DateTimeColumn get operationDate => dateTime()();
  TextColumn get activityType => text()();
  TextColumn get field => text()();
  RealColumn get hectar => real()();
  IntColumn get mandays => integer()();
  TextColumn get remarks =>
      text().nullable()(); // Added nullable as remarks are often optional

  // Labour details
  RealColumn get labourRate => real().withDefault(const Constant(65.38))();
  IntColumn get labourOtHour => integer()();
  RealColumn get labourOtRate => real().withDefault(const Constant(13.17))();
  IntColumn get labourPieceQty => integer()();
  RealColumn get labourPieceRate => real()();

  // Supervision and Driver
  RealColumn get supervisionRate => real().withDefault(const Constant(65.38))();
  RealColumn get driverRate => real().withDefault(const Constant(65.38))();

  // Materials
  TextColumn get materialType => text()();
  IntColumn get materialQty => integer()();
  RealColumn get materialLitreRate => real()();

  // Evit
  RealColumn get evitTime => real()();
  RealColumn get evitRate => real()();
}
