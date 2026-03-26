import 'package:palmx/core/local/database.dart';

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
}
