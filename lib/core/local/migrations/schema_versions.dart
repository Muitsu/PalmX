import 'package:drift/drift.dart';
import 'package:palmx/data/local/tables/tables.dart';
import '../database.dart';

class DatabaseMigration {
  static MigrationStrategy strategy(AppDatabase db) {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
        // Initial Seed logic here
        await _seedInitialData(db);
      },
      onUpgrade: (m, from, to) async {
        if (from < 2) {
          // Operations used to store a single material inline; move it into
          // its own table so an operation can have more than one material.
          await m.createTable(db.operationMaterialsTable);
          await db.customStatement('''
            INSERT INTO operation_materials_table (operation_log_id, material_type, material_qty, material_rate)
            SELECT id, material_type, material_qty, material_litre_rate
            FROM operation_logs_table
            WHERE material_type IS NOT NULL
          ''');
          await m.dropColumn(db.operationLogsTable, 'material_type');
          await m.dropColumn(db.operationLogsTable, 'material_qty');
          await m.dropColumn(db.operationLogsTable, 'material_litre_rate');
        }
      },
      beforeOpen: (details) async {
        await db.customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }

  static Future<void> _seedInitialData(AppDatabase db) async {
    await db.batch((b) {
      b.insertAll(
        db.activityTable,
        activityUnitMap.entries.map((entry) {
          return ActivityTableCompanion.insert(
            name: entry.key,
            activityCost: entry.value,
          );
        }).toList(),
      );
      b.insertAll(
        db.materialTable,
        materialCostMap.entries.map((entry) {
          final value = entry.value;

          return MaterialTableCompanion.insert(
            name: entry.key,
            price: Value(value['price'] as double),
            materialFormat: value['format'] as MaterialFormat,
          );
        }).toList(),
      );
    });
  }
}

final Map<String, ActivityCost> activityUnitMap = {
  // Cost/Ha activities
  'Circle & Strip Spraying': ActivityCost.costHA,
  'P&D Spraying': ActivityCost.costHA,
  'Spot Spraying': ActivityCost.costHA,
  'BBC (Black Bunch Census)': ActivityCost.costHA,
  'BOB Census': ActivityCost.costHA,
  'P&D Census': ActivityCost.costHA,
  'Rat Baiting Application': ActivityCost.costHA,
  'Raking - Blowing': ActivityCost.costHA,
  'Manuring - Manual Application': ActivityCost.costHA,
  'Manuring - Mechanize Application': ActivityCost.costHA,
  'EFB Application': ActivityCost.costHA,
  'SPG (Separate Pruning gang)': ActivityCost.costHA,

  // Cost/mt activities
  'Harvesting': ActivityCost.costMT,
  'Internal Transport': ActivityCost.costMT,
  'External Transport': ActivityCost.costMT,
  'Loose Fruit Collection': ActivityCost.costMT,
  'Separate Loose Fruit Collection': ActivityCost.costMT,

  // Cost/palm activities
  'Pruning': ActivityCost.costPALM,
  'Raking - Manual': ActivityCost.costPALM,
};
final Map<String, Map<String, dynamic>> materialCostMap = {
  'Monex HC': {'price': 18.0, 'format': MaterialFormat.litre},
  'Promax (Acephate)': {'price': 28.4, 'format': MaterialFormat.kg},
  'Ancom Sodium Chlorate': {'price': 6.1, 'format': MaterialFormat.kg},
  '(triester) Triclopyl Butotyl': {
    'price': 13.45,
    'format': MaterialFormat.litre,
  },
  'Adjuvant Wetting agent': {'price': 2.1, 'format': MaterialFormat.litre},
  '(Supremo) Glyphostae Isopropylamine': {
    'price': 8.2,
    'format': MaterialFormat.litre,
  },
  '(Alion) Indaziflam': {'price': 650.0, 'format': MaterialFormat.litre},
  '(Cyper) Cypermethrin': {'price': 5.7, 'format': MaterialFormat.litre},
  '(Acosta) Glufosinate ammonium': {
    'price': 6.2,
    'format': MaterialFormat.litre,
  },
};
