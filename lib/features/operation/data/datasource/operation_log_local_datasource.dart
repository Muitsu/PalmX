import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:palmx/core/local/database.dart';
import 'package:palmx/data/local/models/operation_log_model.dart';
import 'package:palmx/data/local/models/operation_material_model.dart';
import 'package:rxdart/rxdart.dart';

@lazySingleton
class OperationLogsLocalDatasource {
  final AppDatabase _db;

  OperationLogsLocalDatasource(this._db);
  // --- CREATE / UPDATE ---

  /// Inserts or updates a single log along with its materials.
  /// Drift's insertOnConflictUpdate requires a primary key (id) to be present in the companion to update.
  /// Materials are fully replaced on every save (existing rows for this log are deleted first).
  Future<int> upsert(
    OperationLogsTableCompanion entry, {
    List<OperationMaterialModel> materials = const [],
  }) async {
    return _db.transaction(() async {
      final logId = await _db
          .into(_db.operationLogsTable)
          .insertOnConflictUpdate(entry);

      await (_db.delete(
        _db.operationMaterialsTable,
      )..where((tbl) => tbl.operationLogId.equals(logId))).go();

      if (materials.isNotEmpty) {
        await _db.batch((b) {
          b.insertAll(
            _db.operationMaterialsTable,
            materials
                .map(
                  (m) => OperationMaterialsTableCompanion.insert(
                    operationLogId: logId,
                    materialType: Value(m.materialType),
                    materialQty: Value(m.materialQty),
                    materialRate: Value(m.materialRate),
                  ),
                )
                .toList(),
          );
        });
      }

      return logId;
    });
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

  /// Attaches each log's materials, grouped by their parent operation log id.
  /// Callers re-run this on every emission of a `watch()` on
  /// operationLogsTable rather than watching operationMaterialsTable
  /// directly — safe because materials are only ever written via [upsert],
  /// which always touches the parent row in the same transaction.
  Future<List<OperationLogModel>> _attachMaterials(
    List<OperationLogsTableData> rows,
  ) async {
    if (rows.isEmpty) return [];

    final ids = rows.map((r) => r.id).toList();
    final materialRows = await (_db.select(
      _db.operationMaterialsTable,
    )..where((tbl) => tbl.operationLogId.isIn(ids))).get();

    final grouped = <int, List<OperationMaterialModel>>{};
    for (final m in materialRows) {
      grouped
          .putIfAbsent(m.operationLogId, () => [])
          .add(OperationMaterialModel.fromDrift(m));
    }

    return rows
        .map(
          (row) => OperationLogModel.fromDrift(
            row,
            materials: grouped[row.id] ?? const [],
          ),
        )
        .toList();
  }

  // --- NEW: Fetch by Date ---
  /// Fetches all logs for a specific month (e.g., March 2026), materials attached.
  Future<List<OperationLogModel>> getByMonth(DateTime date) async {
    // Start of the month: 2026-03-01 00:00:00
    final firstDay = DateTime(date.year, date.month, 1);

    // End of the month: 2026-04-01 00:00:00
    // (By adding 1 month and setting day to 1, we get the start of next month)
    final lastDay = DateTime(date.year, date.month + 1, 1);

    final rows = await (_db.select(
          _db.operationLogsTable,
        )..where((tbl) => tbl.operationDate.isBetweenValues(firstDay, lastDay)))
        .get();

    return _attachMaterials(rows);
  }

  Future<List<OperationLogsTableData>> getAllByDate(DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return await (_db.select(_db.operationLogsTable)..where(
          (tbl) => tbl.operationDate.isBetweenValues(startOfDay, endOfDay),
        ))
        .get();
  }

  /// Streams all logs for a specific day (UI updates automatically), materials attached.
  Stream<List<OperationLogModel>> watchByDate(DateTime date) {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return (_db.select(_db.operationLogsTable)..where(
          (tbl) => tbl.operationDate.isBetweenValues(startOfDay, endOfDay),
        ))
        .watch()
        .asyncMap(_attachMaterials);
  }

  /// Streams logs matching the given filters, newest first, materials attached.
  /// Pass `null` for a filter to skip it (e.g. no month = all time).
  Stream<List<OperationLogModel>> watchFiltered({
    DateTime? month,
    String? activityType,
  }) {
    final query = _db.select(_db.operationLogsTable);

    if (month != null) {
      final firstDay = DateTime(month.year, month.month, 1);
      final lastDay = DateTime(month.year, month.month + 1, 1);
      query.where(
        (tbl) => tbl.operationDate.isBetweenValues(firstDay, lastDay),
      );
    }

    if (activityType != null) {
      query.where((tbl) => tbl.activityType.equals(activityType));
    }

    query.orderBy([
      (tbl) =>
          OrderingTerm(expression: tbl.operationDate, mode: OrderingMode.desc),
    ]);

    return query.watch().asyncMap(_attachMaterials);
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

  /// Returns a real-time Stream of the 4 most recent operation logs, materials attached.
  /// Sorted by operationDate descending.
  Stream<List<OperationLogModel>> watchRecentOperations({int limit = 4}) {
    return (_db.select(_db.operationLogsTable)
          ..orderBy([
            (tbl) => OrderingTerm(
              expression: tbl.operationDate,
              mode: OrderingMode.desc,
            ),
          ])
          ..limit(limit))
        .watch()
        .asyncMap(_attachMaterials);
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

  // Drift uses the top-level coalesce() function for nullable columns.
  // Materials now live in their own table and are summed separately (see
  // _watchMaterialCostBetween) since they're no longer columns here.
  Expression<double> _nonMaterialCostExpression($OperationLogsTableTable tbl) {
    return (
    // Labour (Non-nullable due to defaults in your table)
    (tbl.labourRate * tbl.labourQty) +
    (tbl.labourOtHour * tbl.labourOtRate) +
    (tbl.labourPieceUnit * tbl.labourPieceRate) +
    (tbl.labourHarvestUnit * tbl.labourHarvestRate) +
    // Supervision & Driver (Non-nullable due to defaults)
    (tbl.supervisionMandays * tbl.supervisionRate) +
    (tbl.driverTotal * tbl.driverRate) +
    // Evit (Nullable: wrap with coalesce)
    (coalesce<double>([tbl.evitRate, const Constant(0.0)]) *
        coalesce<double>([tbl.evitTime, const Constant(0.0)])));
  }

  Stream<double> _watchNonMaterialCostBetween(DateTime start, DateTime end) {
    final tbl = _db.operationLogsTable;
    final totalSum = _nonMaterialCostExpression(tbl).sum();

    final query = _db.selectOnly(tbl)
      ..addColumns([totalSum])
      ..where(tbl.operationDate.isBetweenValues(start, end));

    return query.map((row) => row.read(totalSum) ?? 0.0).watchSingle();
  }

  /// Sums material costs for logs whose operationDate falls between [start]
  /// and [end], joining through to the parent log for the date filter.
  Stream<double> _watchMaterialCostBetween(DateTime start, DateTime end) {
    final matTbl = _db.operationMaterialsTable;
    final logTbl = _db.operationLogsTable;
    final costSum = (matTbl.materialQty.cast<double>() * matTbl.materialRate)
        .sum();

    final query = _db.selectOnly(matTbl)
      ..addColumns([costSum])
      ..join([innerJoin(logTbl, logTbl.id.equalsExp(matTbl.operationLogId))])
      ..where(logTbl.operationDate.isBetweenValues(start, end));

    return query.map((row) => row.read(costSum) ?? 0.0).watchSingle();
  }

  Stream<double> _watchTotalCostBetween(DateTime start, DateTime end) {
    return Rx.combineLatest2<double, double, double>(
      _watchNonMaterialCostBetween(start, end),
      _watchMaterialCostBetween(start, end),
      (nonMaterial, material) => nonMaterial + material,
    );
  }

  Stream<double> watchMonthlyTotalCost(DateTime date) {
    final firstDay = DateTime(date.year, date.month, 1);
    final lastDay = DateTime(date.year, date.month + 1, 1);
    return _watchTotalCostBetween(firstDay, lastDay);
  }

  /// Returns a real-time Stream of the total cost across the whole year of [date].
  Stream<double> watchYearlyTotalCost(DateTime date) {
    final firstDay = DateTime(date.year, 1, 1);
    final lastDay = DateTime(date.year + 1, 1, 1);
    return _watchTotalCostBetween(firstDay, lastDay);
  }

  Stream<double> _watchPercentageDiff({
    required Stream<double> current,
    required Stream<double> previous,
  }) {
    // Using rxdart to combine both streams and calculate the % diff
    return Rx.combineLatest2<double, double, double>(current, previous, (
      currentValue,
      previousValue,
    ) {
      if (previousValue == 0) {
        return currentValue > 0 ? 100.0 : 0.0; // Avoid division by zero
      }

      // Formula: ((Current - Previous) / Previous) * 100
      final diff = ((currentValue - previousValue) / previousValue) * 100;

      // Returns positive if increased, negative if decreased
      return double.parse(diff.toStringAsFixed(1));
    });
  }

  /// Returns a real-time Stream of the percentage change in total cost
  /// compared to the previous month.
  Stream<double> watchDifferencePercentage(DateTime date) {
    final prevMonthDate = DateTime(date.year, date.month - 1, 1);
    return _watchPercentageDiff(
      current: watchMonthlyTotalCost(date),
      previous: watchMonthlyTotalCost(prevMonthDate),
    );
  }

  /// Returns a real-time Stream of the percentage change in total cost
  /// compared to the previous year.
  Stream<double> watchYearlyDifferencePercentage(DateTime date) {
    final prevYearDate = DateTime(date.year - 1, date.month, date.day);
    return _watchPercentageDiff(
      current: watchYearlyTotalCost(date),
      previous: watchYearlyTotalCost(prevYearDate),
    );
  }
}
