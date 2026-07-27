import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:palmx/core/error/failure.dart';
import 'package:palmx/data/local/models/operation_log_model.dart';
import 'package:palmx/features/operation/domain/repository/operation_repository.dart';

@lazySingleton
class GetOperationByMonth {
  final OperationRepository repository;
  GetOperationByMonth(this.repository);

  Future<Either<Failure, List<OperationLogModel>>> call(DateTime date) async {
    return await repository.getByMonth(date);
  }
}
