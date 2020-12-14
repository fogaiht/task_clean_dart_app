import 'package:dartz/dartz.dart' hide Task;
import '../entities/task.dart';

import '../errors/erros.dart';

abstract class ITaskRepository {
  Future<Either<IFailure, Task>> addNewTask(Task task);

  Future<Either<IFailure, List<Task>>> retrieveAllTask();

  Future<Either<IFailure, Task>> updateTask(Task task);

  Future<Either<IFailure, bool>> removeTask(Task task);
}
