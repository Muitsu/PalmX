import 'package:drift/drift.dart';
import 'package:palmx/core/local/database.dart';

class FieldsLocalDatasource {
  static final FieldsLocalDatasource _instance =
      FieldsLocalDatasource._internal();

  factory FieldsLocalDatasource() => _instance;

  late final AppDatabase _db;

  FieldsLocalDatasource._internal() {
    _db = AppDatabase();
  }

  // --- CREATE / UPDATE ---

  /// Inserts a new field or updates an existing one if the ID matches.
  Future<int> upsert(FieldTableCompanion entry) async {
    return await _db.into(_db.fieldTable).insertOnConflictUpdate(entry);
  }

  /// Batch insert multiple fields (useful for syncing from API)
  Future<void> insertAll(List<FieldTableCompanion> entries) async {
    await _db.batch((b) {
      b.insertAllOnConflictUpdate(_db.fieldTable, entries);
    });
  }

  // --- READ ---

  /// Fetches all fields alphabetically by code
  Future<List<FieldTableData>> getAll() async {
    return await (_db.select(
      _db.fieldTable,
    )..orderBy([(t) => OrderingTerm(expression: t.name)])).get();
  }

  /// Watch fields for real-time UI updates (e.g., in a dropdown)
  Stream<List<FieldTableData>> watchAll() {
    return (_db.select(
      _db.fieldTable,
    )..orderBy([(t) => OrderingTerm(expression: t.name)])).watch();
  }

  /// Fetch a single field by ID
  Future<FieldTableData?> getById(int id) async {
    return await (_db.select(
      _db.fieldTable,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  /// Search fields by code or description
  Future<List<FieldTableData>> searchFields(String query) async {
    return await (_db.select(
      _db.fieldTable,
    )..where((t) => t.name.contains(query))).get();
  }

  // --- DELETE ---

  /// Delete a specific field
  Future<int> deleteById(int id) async {
    return await (_db.delete(
      _db.fieldTable,
    )..where((t) => t.id.equals(id))).go();
  }

  /// Clear the entire table
  Future<int> deleteAll() async {
    return await _db.delete(_db.fieldTable).go();
  }
}
