import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:palmx/core/error/failure.dart';
import 'package:palmx/core/local/database.dart';
import 'package:palmx/features/operation/domain/repository/operation_repository.dart';

@lazySingleton
class GetOperationByMonth {
  final OperationRepository repository;
  GetOperationByMonth(this.repository);

  Future<Either<Failure, List<OperationLogsTableData>>> call(
    DateTime date,
  ) async {
    return await repository.getByMonth(date);
  }
}
