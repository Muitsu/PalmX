import 'package:drift/drift.dart';
import 'package:palmx/core/local/database.dart';
import 'package:palmx/data/local/tables/activity_table.dart';

class ActivityModel extends ActivityTableData {
  ActivityModel({
    required super.id,
    required super.name,
    required super.activityCost,
  });

  /// Factory to convert raw Drift data to our Model
  factory ActivityModel.fromDrift(ActivityTableData data) {
    return ActivityModel(
      id: data.id,
      name: data.name,
      activityCost: data.activityCost,
    );
  }

  static ActivityTableCompanion toInsert({
    int? id,
    required String name,
    required ActivityCost activityCost,
  }) {
    return ActivityTableCompanion.insert(
      id: id == null ? Value.absent() : Value(id),
      name: name,
      activityCost: activityCost,
    );
  }
}
