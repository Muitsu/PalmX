import 'dart:developer' as dev;

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:palmx/core/error/failure.dart';
import 'package:palmx/core/local/database.dart';
import 'package:palmx/data/local/models/operation_log_model.dart';
import 'package:palmx/data/local/models/operation_material_model.dart';
import 'package:palmx/features/operation/data/datasource/operation_log_local_datasource.dart';
import 'package:palmx/features/operation/domain/repository/operation_repository.dart';

@LazySingleton(as: OperationRepository)
class OperationLocalRepositoryImpl extends OperationRepository {
  final OperationLogsLocalDatasource remote;
  OperationLocalRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, int>> save({
    required OperationLogsTableCompanion entry,
    List<OperationMaterialModel> materials = const [],
  }) async {
    try {
      final result = await remote.upsert(entry, materials: materials);
      return right(result);
    } catch (e) {
      dev.log(e.toString());
      return left(Failure('Something went wrong'));
    }
  }

  @override
  Future<Either<Failure, List<OperationLogModel>>> getByMonth(
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
  Stream<List<OperationLogModel>> streamRecent({int limit = 4}) {
    return remote.watchRecentOperations(limit: limit);
  }

  @override
  Stream<List<OperationLogModel>> streamFiltered({
    DateTime? month,
    String? activityType,
  }) => remote.watchFiltered(month: month, activityType: activityType);

  @override
  Stream<int> streamCount() => remote.watchTotalCount();

  @override
  Stream<double> streamMonthlyTotalCost({required DateTime date}) =>
      remote.watchMonthlyTotalCost(date);

  @override
  Stream<double> streamYearlyTotalCost({required DateTime date}) =>
      remote.watchYearlyTotalCost(date);

  @override
  Stream<double> watchDifferencePercentage({required DateTime date}) =>
      remote.watchDifferencePercentage(date);

  @override
  Stream<double> watchYearlyDifferencePercentage({required DateTime date}) =>
      remote.watchYearlyDifferencePercentage(date);
}
