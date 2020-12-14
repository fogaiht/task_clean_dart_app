import 'package:dartz/dartz.dart' hide Task;

import '../entities/task.dart';
import '../errors/erros.dart';
import '../repositories/task_repository_interface.dart';

abstract class IRemoveTask {
  Future<Either<IFailure, void>> call(Task task);
}

class RemoveTask implements IRemoveTask {
  final ITaskRepository repository;

  RemoveTask(this.repository);

  @override
  Future<Either<IFailure, bool>> call(Task task) async {
    assert(task.id != null);
    return await repository.removeTask(task);
  }
}
