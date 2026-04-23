import 'package:fpdart/fpdart.dart';
import 'package:palmx/core/error/failure.dart';
import 'package:palmx/core/local/database.dart';

abstract class OperationRepository {
  Future<Either<Failure, int>> save({
    required OperationLogsTableCompanion entry,
  });
  Future<Either<Failure, List<OperationLogsTableData>>> getByMonth(
    DateTime date,
  );
  Stream<List<OperationLogsTableData>> streamRecent({int limit = 4});
  Stream<int> streamCount();
  Stream<double> streamMonthlyTotalCost({required DateTime date});
  Stream<double> watchDifferencePercentage({required DateTime date});
}
