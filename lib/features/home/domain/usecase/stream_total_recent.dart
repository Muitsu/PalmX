import 'package:injectable/injectable.dart';
import 'package:palmx/features/operation/domain/repository/operation_repository.dart';

@lazySingleton
class StreamTotalRecent {
  final OperationRepository repository;
  StreamTotalRecent(this.repository);

  Stream<int> call() => repository.streamCount();
}
