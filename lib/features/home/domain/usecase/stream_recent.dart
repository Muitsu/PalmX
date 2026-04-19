import 'package:injectable/injectable.dart';
import 'package:palmx/core/local/database.dart';
import 'package:palmx/features/operation/domain/repository/operation_repository.dart';

@lazySingleton
class StreamRecent {
  final OperationRepository repository;
  StreamRecent(this.repository);

  Stream<List<OperationLogsTableData>> call({int limit = 4}) =>
      repository.streamRecent(limit: limit);
}
