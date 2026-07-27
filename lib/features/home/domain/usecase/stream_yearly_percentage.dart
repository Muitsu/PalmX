import 'package:injectable/injectable.dart';
import 'package:palmx/features/operation/domain/repository/operation_repository.dart';

@lazySingleton
class StreamYearlyPercentage {
  final OperationRepository repository;
  StreamYearlyPercentage(this.repository);

  Stream<double> call({required DateTime date}) =>
      repository.watchYearlyDifferencePercentage(date: date);
}
