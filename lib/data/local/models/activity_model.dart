import 'package:drift/drift.dart';
import 'package:palmx/core/local/database.dart';
import 'package:palmx/data/local/tables/activity_table.dart';

import 'package:equatable/equatable.dart';

class ActivityModel extends Equatable {
  final int? id;
  final String? name;
  final ActivityCost? activityCost;

  const ActivityModel({this.id, this.name, this.activityCost});

  @override
  List<Object?> get props => [id, name, activityCost];

  factory ActivityModel.fromDrift(ActivityTableData data) {
    return ActivityModel(
      id: data.id,
      name: data.name,
      activityCost: data.activityCost,
    );
  }

  ActivityTableCompanion toCompanion() {
    return ActivityTableCompanion(
      id: id == null ? const Value.absent() : Value(id!),
      name: name == null ? const Value.absent() : Value(name!),
      activityCost: activityCost == null
          ? const Value.absent()
          : Value(activityCost!),
    );
  }

  ActivityModel copyWith({int? id, String? name, ActivityCost? activityCost}) {
    return ActivityModel(
      id: id ?? this.id,
      name: name ?? this.name,
      activityCost: activityCost ?? this.activityCost,
    );
  }

  static ActivityTableCompanion toInsert({
    int? id,
    String? name,
    ActivityCost? activityCost,
  }) {
    return ActivityTableCompanion.insert(
      id: id == null ? const Value.absent() : Value(id),
      name: name!,
      activityCost: activityCost!,
    );
  }
}
