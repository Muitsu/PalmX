import 'dart:developer' as dev;

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:palmx/core/error/failure.dart';
import 'package:palmx/core/local/database.dart';
import 'package:palmx/features/operation/data/datasource/operation_log_local_datasource.dart';
import 'package:palmx/features/operation/domain/repository/operation_repository.dart';

@LazySingleton(as: OperationRepository)
class OperationLocalRepositoryImpl extends OperationRepository {
  final OperationLogsLocalDatasource remote;
  OperationLocalRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, int>> save({
    required OperationLogsTableCompanion entry,
  }) async {
    try {
      final result = await remote.upsert(entry);
      return right(result);
    } catch (e) {
      dev.log(e.toString());
      return left(Failure('Something went wrong'));
    }
  }

  @override
  Future<Either<Failure, List<OperationLogsTableData>>> getByMonth(
    DateTime date,
  ) async {
    try {
      final result = await remote.getByMonth(date);
      return right(result);
    } catch (e) {
      dev.log(e.toString());
      return left(Failure('Something went wrong'));
    }
  }

  @override
  Stream<List<OperationLogsTableData>> streamRecent({int limit = 4}) {
    return remote.watchRecentOperations(limit: limit);
  }

  @override
  Stream<int> streamCount() => remote.watchTotalCount();

  @override
  Stream<double> streamMonthlyTotalCost({required DateTime date}) =>
      remote.watchMonthlyTotalCost(date);

  @override
  Stream<double> watchDifferencePercentage({required DateTime date}) =>
      remote.watchDifferencePercentage(date);
}
