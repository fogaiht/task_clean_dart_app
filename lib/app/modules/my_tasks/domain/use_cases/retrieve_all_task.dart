import 'package:dartz/dartz.dart' hide Task;
import '../entities/task.dart';
import '../errors/erros.dart';
import '../repositories/task_repository_interface.dart';

abstract class IRetrieveAllTask {
  Future<Either<IFailure, List<Task>>> call();
}

class RetrieveAllTask implements IRetrieveAllTask {
  final ITaskRepository repository;

  RetrieveAllTask(this.repository);

  @override
  Future<Either<IFailure, List<Task>>> call() async {
    return await repository.retrieveAllTask();
  }
}
