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
}
