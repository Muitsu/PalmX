import 'package:injectable/injectable.dart';
import 'package:palmx/data/local/models/operation_log_model.dart';
import 'package:palmx/features/operation/domain/repository/operation_repository.dart';

@lazySingleton
class StreamFilteredOperations {
  final OperationRepository repository;
  StreamFilteredOperations(this.repository);

  Stream<List<OperationLogModel>> call({
    DateTime? month,
    String? activityType,
  }) => repository.streamFiltered(month: month, activityType: activityType);
}
