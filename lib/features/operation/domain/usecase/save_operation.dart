import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:palmx/core/error/failure.dart';
import 'package:palmx/core/local/database.dart';
import 'package:palmx/data/local/models/operation_material_model.dart';
import 'package:palmx/features/operation/domain/repository/operation_repository.dart';

@lazySingleton
class SaveOperation {
  final OperationRepository repository;
  SaveOperation(this.repository);

  Future<Either<Failure, int>> call({
    required OperationLogsTableCompanion entry,
    List<OperationMaterialModel> materials = const [],
  }) async {
    return await repository.save(entry: entry, materials: materials);
  }
}
