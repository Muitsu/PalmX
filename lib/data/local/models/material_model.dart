import 'package:palmx/core/local/database.dart';

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
}
