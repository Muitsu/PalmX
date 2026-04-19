import 'package:injectable/injectable.dart';
import 'package:palmx/features/operation/domain/repository/operation_repository.dart';

@lazySingleton
class StreamMonthlyTotalCost {
  final OperationRepository repository;
  StreamMonthlyTotalCost(this.repository);

  Stream<double> call({required DateTime date}) =>
      repository.streamMonthlyTotalCost(date: date);
}
