import 'package:injectable/injectable.dart';
import 'package:palmx/features/operation/domain/repository/operation_repository.dart';

@lazySingleton
class StreamMonthlyPercentage {
  final OperationRepository repository;
  StreamMonthlyPercentage(this.repository);

  Stream<double> call({required DateTime date}) =>
      repository.watchDifferencePercentage(date: date);
}
