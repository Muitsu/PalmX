import 'package:injectable/injectable.dart';
import 'package:palmx/features/operation/domain/repository/operation_repository.dart';

@lazySingleton
class StreamYearlyTotalCost {
  final OperationRepository repository;
  StreamYearlyTotalCost(this.repository);

  Stream<double> call({required DateTime date}) =>
      repository.streamYearlyTotalCost(date: date);
}
