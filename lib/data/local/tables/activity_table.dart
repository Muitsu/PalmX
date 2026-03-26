import 'package:drift/drift.dart';

class ActivityTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get activityCost => textEnum<ActivityCost>()();
}

enum ActivityCost { costHA, costMT, costPALM }
