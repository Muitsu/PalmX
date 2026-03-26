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
      onUpgrade: (m, from, to) async {},
      beforeOpen: (details) async {},
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
