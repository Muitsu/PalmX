import 'package:fpdart/fpdart.dart';
import 'package:palmx/core/error/failure.dart';
import 'package:palmx/core/local/database.dart';
import 'package:palmx/data/local/models/operation_log_model.dart';
import 'package:palmx/data/local/models/operation_material_model.dart';

abstract class OperationRepository {
  Future<Either<Failure, int>> save({
    required OperationLogsTableCompanion entry,
    List<OperationMaterialModel> materials = const [],
  });
  Future<Either<Failure, List<OperationLogModel>>> getByMonth(DateTime date);
  Stream<List<OperationLogModel>> streamRecent({int limit = 4});
  Stream<List<OperationLogModel>> streamFiltered({
    DateTime? month,
    String? activityType,
  });
  Stream<int> streamCount();
  Stream<double> streamMonthlyTotalCost({required DateTime date});
  Stream<double> streamYearlyTotalCost({required DateTime date});
  Stream<double> watchDifferencePercentage({required DateTime date});
  Stream<double> watchYearlyDifferencePercentage({required DateTime date});
}
