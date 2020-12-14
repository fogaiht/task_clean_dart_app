import 'local_database.dart';

class DatabaseShared {
  AppDatabase _databaseShared;

  Future call() async {
    _databaseShared = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  }

  AppDatabase get database => _databaseShared;
}
