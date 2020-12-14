import 'package:floor/floor.dart';

import '../models/task_entidade.dart';

@dao
abstract class TasksDao {
  @Query('SELECT * FROM TaskEntidade')
  Future<List<TaskEntidade>> retrieveAllTask();

  @update
  Future<void> updateTask(TaskEntidade task);

  @insert
  Future<void> addNewTask(TaskEntidade task);

  @delete
  Future<void> deleteTask(TaskEntidade task);
}
