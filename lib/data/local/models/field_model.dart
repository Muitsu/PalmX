import 'package:drift/drift.dart';
import 'package:palmx/core/local/database.dart';

class FieldModel extends FieldTableData {
  FieldModel({required super.id, required super.name});

  /// Factory to convert raw Drift data to our Model
  factory FieldModel.fromDrift(FieldTableData data) {
    return FieldModel(id: data.id, name: data.name);
  }

  static FieldTableCompanion toInsert({int? id, required String name}) {
    return FieldTableCompanion.insert(
      id: id == null ? const Value.absent() : Value(id),
      name: name,
    );
  }
}
