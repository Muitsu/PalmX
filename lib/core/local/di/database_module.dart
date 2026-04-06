import 'package:injectable/injectable.dart';
import 'package:palmx/core/local/database.dart';

@module
abstract class DatabaseModule {
  @lazySingleton
  AppDatabase get appDatabase => AppDatabase();
}
