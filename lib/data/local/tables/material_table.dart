import 'package:drift/drift.dart';

class MaterialTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  RealColumn get price => real().withDefault(Constant(0.00))();
  TextColumn get materialFormat => textEnum<MaterialFormat>()();
}

enum MaterialFormat { litre, kg, box, bag }
