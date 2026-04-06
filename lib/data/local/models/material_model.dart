import 'package:drift/drift.dart';
import 'package:palmx/core/local/database.dart';
import 'package:palmx/data/local/tables/material_table.dart';

class MaterialModel extends MaterialTableData {
  MaterialModel({
    required super.id,
    required super.name,
    required super.price,
    required super.materialFormat,
  });

  /// Factory to convert raw Drift data to our Model
  factory MaterialModel.fromDrift(MaterialTableData data) {
    return MaterialModel(
      id: data.id,
      name: data.name,
      price: data.price,
      materialFormat: data.materialFormat,
    );
  }

  static MaterialTableCompanion toInsert({
    int? id,
    required String name,
    required double price,
    required MaterialFormat materialFormat,
  }) {
    return MaterialTableCompanion.insert(
      id: id == null ? Value.absent() : Value(id),
      name: name,
      price: Value(price),
      materialFormat: materialFormat,
    );
  }
}
