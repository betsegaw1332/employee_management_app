import 'package:employee_management_app/src/data/data.dart';
import 'package:employee_management_app/src/utils/utils.dart';
import 'package:get_it/get_it.dart';

import 'src/presentation/blocs/blocs.dart';

GetIt serviceLocator = GetIt.instance;

Future<void> serviceLocatorInit() async {
  final db =
      await $FloorAppDatabase.databaseBuilder(AppStrings.databaseName).build();
  serviceLocator.registerSingleton<AppDatabase>(db);
  serviceLocator
      .registerFactory<DatabaseRepositoryImpl>(() => DatabaseRepositoryImpl());
  serviceLocator.registerSingleton<EmployeeBloc>(EmployeeBloc());
}
