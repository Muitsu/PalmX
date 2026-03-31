import 'package:drift/drift.dart';
import 'package:palmx/core/local/database.dart';
import 'package:palmx/data/local/models/activity_model.dart';

class ActivityLocalDatasource {
  static final ActivityLocalDatasource _instance =
      ActivityLocalDatasource._internal();

  factory ActivityLocalDatasource() => _instance;

  late final AppDatabase _db;

  ActivityLocalDatasource._internal() {
    _db = AppDatabase();
  }

  // --- CREATE / UPDATE ---

  /// Inserts a new field or updates an existing one if the ID matches.
  Future<int> upsert(ActivityTableCompanion entry) async {
    return await _db.into(_db.activityTable).insertOnConflictUpdate(entry);
  }

  /// Batch insert multiple fields (useful for syncing from API)
  Future<void> insertAll(List<ActivityTableCompanion> entries) async {
    await _db.batch((b) {
      b.insertAllOnConflictUpdate(_db.activityTable, entries);
    });
  }

  // --- READ ---

  /// Fetches all fields alphabetically by code
  Future<List<ActivityModel>> getAll() async {
    return await (_db.select(_db.activityTable)
          ..orderBy([(t) => OrderingTerm(expression: t.name)]))
        .get()
        .then((rows) => rows.map((e) => ActivityModel.fromDrift(e)).toList());
  }

  /// Watch fields for real-time UI updates (e.g., in a dropdown)
  Stream<List<ActivityTableData>> watchAll() {
    return (_db.select(
      _db.activityTable,
    )..orderBy([(t) => OrderingTerm(expression: t.name)])).watch();
  }

  /// Fetch a single field by ID
  Future<ActivityModel?> getById(int id) async {
    return await (_db.select(_db.activityTable)..where((t) => t.id.equals(id)))
        .getSingleOrNull()
        .then((data) => data != null ? ActivityModel.fromDrift(data) : null);
  }

  /// Search fields by code or description
  Future<List<ActivityModel>> searchFields(String query) async {
    return await (_db.select(_db.activityTable)..where(
          (t) => t.name.contains(query) | t.activityCost.contains(query),
        ))
        .get()
        .then((rows) => rows.map((e) => ActivityModel.fromDrift(e)).toList());
  }

  // --- DELETE ---

  /// Delete a specific field
  Future<int> deleteById(int id) async {
    return await (_db.delete(
      _db.activityTable,
    )..where((t) => t.id.equals(id))).go();
  }

  /// Clear the entire table
  Future<int> deleteAll() async {
    return await _db.delete(_db.activityTable).go();
  }
}
