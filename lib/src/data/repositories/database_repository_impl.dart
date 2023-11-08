

import 'package:employee_management_app/service_locator.dart';
import 'package:employee_management_app/src/data/data.dart';
import 'package:employee_management_app/src/domain/domain.dart';

class DatabaseRepositoryImpl extends DatabaseRepository {
  final AppDatabase _appDatabase;

  DatabaseRepositoryImpl() : _appDatabase = serviceLocator<AppDatabase>();

  @override
  Future<List<EmployeeModel>> getSavedEmployees() async {
    return _appDatabase.employeeDao.getAllEmployees();
  }

  @override
  Future<void> removeEmployee(EmployeeModel employee) {
    return _appDatabase.employeeDao.deleteEmployee(employee);
  }

  @override
  Future<void> saveEmployee(EmployeeModel employee) {
    return _appDatabase.employeeDao.insertEmployee(employee);
  }
  
  @override
  Future<void> editEmployee(EmployeeModel employee) {
    return _appDatabase.employeeDao.updateEmployee(employee);
  }
}