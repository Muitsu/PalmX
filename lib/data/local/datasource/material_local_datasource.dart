import 'package:drift/drift.dart';
import 'package:palmx/core/local/database.dart';
import 'package:palmx/data/local/tables/material_table.dart';

class MaterialsLocalDatasource {
  static final MaterialsLocalDatasource _instance =
      MaterialsLocalDatasource._internal();

  factory MaterialsLocalDatasource() => _instance;

  late final AppDatabase _db;

  MaterialsLocalDatasource._internal() {
    _db = AppDatabase();
  }

  // --- CREATE / UPDATE ---

  /// Inserts a new material or updates an existing one if the ID matches.
  Future<int> upsert(MaterialTableCompanion entry) async {
    return await _db.into(_db.materialTable).insertOnConflictUpdate(entry);
  }

  /// Batch insert multiple materials
  Future<void> insertAll(List<MaterialTableCompanion> entries) async {
    await _db.batch((b) {
      b.insertAllOnConflictUpdate(_db.materialTable, entries);
    });
  }

  // --- READ ---

  /// Fetches all materials alphabetically by name
  Future<List<MaterialTableData>> getAll() async {
    return await (_db.select(
      _db.materialTable,
    )..orderBy([(t) => OrderingTerm(expression: t.name)])).get();
  }

  /// Watch materials for real-time UI updates
  Stream<List<MaterialTableData>> watchAll() {
    return (_db.select(
      _db.materialTable,
    )..orderBy([(t) => OrderingTerm(expression: t.name)])).watch();
  }

  /// Fetch a single material by ID
  Future<MaterialTableData?> getById(int id) async {
    return await (_db.select(
      _db.materialTable,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  /// Filter materials by name or specific format (Litre/Kg)
  Future<List<MaterialTableData>> searchMaterials(String query) async {
    return await (_db.select(
      _db.materialTable,
    )..where((t) => t.name.contains(query))).get();
  }

  /// Example: Fetch materials by a specific format (Enum)
  Future<List<MaterialTableData>> getByFormat(MaterialFormat format) async {
    return await (_db.select(
      _db.materialTable,
    )..where((t) => t.materialFormat.equalsValue(format))).get();
  }

  // --- DELETE ---

  /// Delete a specific material
  Future<int> deleteById(int id) async {
    return await (_db.delete(
      _db.materialTable,
    )..where((t) => t.id.equals(id))).go();
  }

  /// Clear the entire table
  Future<int> deleteAll() async {
    return await _db.delete(_db.materialTable).go();
  }
}
