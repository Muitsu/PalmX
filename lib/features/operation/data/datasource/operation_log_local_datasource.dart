import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:palmx/core/local/database.dart';

@lazySingleton
class OperationLogsLocalDatasource {
  final AppDatabase _db;

  OperationLogsLocalDatasource(this._db);
  // --- CREATE / UPDATE ---

  /// Inserts or updates a single log.
  /// Drift's insertOnConflictUpdate requires a primary key (id) to be present in the companion to update.
  Future<int> upsert(OperationLogsTableCompanion entry) async {
    return await _db.into(_db.operationLogsTable).insertOnConflictUpdate(entry);
  }

  // --- READ ---

  /// Fetches all logs as a one-time Future list
  Future<List<OperationLogsTableData>> getAll() async {
    return await _db.select(_db.operationLogsTable).get();
  }

  /// Returns a real-time Stream of all logs.
  /// Useful for UI lists that need to update automatically when data changes.
  Stream<List<OperationLogsTableData>> watchAll() {
    return _db.select(_db.operationLogsTable).watch();
  }

  // --- NEW: Fetch by Date ---
  /// Fetches all logs for a specific month (e.g., March 2026)
  Future<List<OperationLogsTableData>> getByMonth(DateTime date) async {
    // Start of the month: 2026-03-01 00:00:00
    final firstDay = DateTime(date.year, date.month, 1);

    // End of the month: 2026-04-01 00:00:00
    // (By adding 1 month and setting day to 1, we get the start of next month)
    final lastDay = DateTime(date.year, date.month + 1, 1);

    return await (_db.select(
          _db.operationLogsTable,
        )..where((tbl) => tbl.operationDate.isBetweenValues(firstDay, lastDay)))
        .get();
  }

  Future<List<OperationLogsTableData>> getAllByDate(DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return await (_db.select(_db.operationLogsTable)..where(
          (tbl) => tbl.operationDate.isBetweenValues(startOfDay, endOfDay),
        ))
        .get();
  }

  /// Streams all logs for a specific day (UI updates automatically)
  Stream<List<OperationLogsTableData>> watchByDate(DateTime date) {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return (_db.select(_db.operationLogsTable)..where(
          (tbl) => tbl.operationDate.isBetweenValues(startOfDay, endOfDay),
        ))
        .watch();
  }

  /// Fetch a single log by ID
  Future<OperationLogsTableData?> getById(int id) async {
    return await (_db.select(
      _db.operationLogsTable,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  // --- DELETE ---

  /// Deletes a specific log by its local ID
  Future<int> deleteById(int id) async {
    return await (_db.delete(
      _db.operationLogsTable,
    )..where((tbl) => tbl.id.equals(id))).go();
  }

  /// Deletes all entries in the table
  Future<int> deleteAll() async {
    return await _db.delete(_db.operationLogsTable).go();
  }

  /// Returns a real-time Stream of the 4 most recent operation logs.
  /// Sorted by operationDate descending.
  Stream<List<OperationLogsTableData>> watchRecentOperations({int limit = 4}) {
    return (_db.select(_db.operationLogsTable)
          ..orderBy([
            (tbl) => OrderingTerm(
              expression: tbl.operationDate,
              mode: OrderingMode.desc,
            ),
          ])
          ..limit(limit))
        .watch();
  }

  // --- COUNTING ---

  /// Returns a one-time total count of all operation logs.
  Future<int> getTotalCount() async {
    final countExp = _db.operationLogsTable.id.count();
    final query = _db.selectOnly(_db.operationLogsTable)
      ..addColumns([countExp]);

    return await query.map((row) => row.read(countExp) ?? 0).getSingle();
  }

  /// Returns a real-time Stream of the total count.
  /// This will emit a new value every time a row is added or deleted.
  Stream<int> watchTotalCount() {
    final countExp = _db.operationLogsTable.id.count();
    final query = _db.selectOnly(_db.operationLogsTable)
      ..addColumns([countExp]);

    return query.map((row) => row.read(countExp) ?? 0).watchSingle();
  }

  Stream<double> watchMonthlyTotalCost(DateTime date) {
    final firstDay = DateTime(date.year, date.month, 1);
    final lastDay = DateTime(date.year, date.month + 1, 1);

    final tbl = _db.operationLogsTable;

    // Drift uses the top-level coalesce() function for nullable columns
    final rowTotal =
        (
        // Labour (Non-nullable due to defaults in your table)
        (tbl.labourRate * tbl.labourQty) +
        (tbl.labourOtHour * tbl.labourOtRate) +
        (tbl.labourPieceUnit * tbl.labourPieceRate) +
        (tbl.labourHarvestUnit * tbl.labourHarvestRate) +
        // Supervision & Driver (Non-nullable due to defaults)
        (tbl.supervisionMandays * tbl.supervisionRate) +
        (tbl.driverTotal * tbl.driverRate) +
        // Materials (Nullable: wrap with coalesce)
        (coalesce<int>([tbl.materialQty, const Constant(0)]).cast<double>() *
            coalesce<double>([tbl.materialLitreRate, const Constant(0.0)])) +
        // Evit (Nullable: wrap with coalesce)
        (coalesce<double>([tbl.evitRate, const Constant(0.0)]) *
            coalesce<double>([tbl.evitTime, const Constant(0.0)])));

    final totalSum = rowTotal.sum();

    final query = _db.selectOnly(tbl)
      ..addColumns([totalSum])
      ..where(tbl.operationDate.isBetweenValues(firstDay, lastDay));

    return query.map((row) => row.read(totalSum) ?? 0.0).watchSingle();
  }
}
