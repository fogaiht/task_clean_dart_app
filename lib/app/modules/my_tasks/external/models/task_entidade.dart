import 'package:floor/floor.dart';

import '../../domain/entities/task.dart';

@Entity(tableName: 'TaskEntidade')
class TaskEntidade {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final int initTime;
  final int endTime;
  final String description;

  TaskEntidade(this.id, this.initTime, this.endTime, this.description);

  factory TaskEntidade.fromDomain(Task task) {
    return TaskEntidade(
      task.id,
      task.initTime.millisecondsSinceEpoch,
      task.endTime.millisecondsSinceEpoch,
      task.description,
    );
  }

  Task toDomain() {
    return Task(
      id: id,
      initTime: DateTime.fromMillisecondsSinceEpoch(initTime),
      endTime: DateTime.fromMillisecondsSinceEpoch(endTime),
      description: description,
    );
  }
}
