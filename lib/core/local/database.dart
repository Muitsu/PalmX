import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:palmx/core/local/migrations/schema_versions.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../../data/local/tables/tables.dart';

part 'database.g.dart';

//NOTE: If you ever make changes to the table later, re-run the command.
//dart run build_runner build --delete-conflicting-outputs

@DriftDatabase(tables: [OperationLogsTable, ActivityTable, FieldTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase._internal() : super(_openConnection());

  static final AppDatabase _instance = AppDatabase._internal();

  factory AppDatabase() => _instance;

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => DatabaseMigration.strategy(this);
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'palmx.db'));
    return NativeDatabase(file);
  });
}
