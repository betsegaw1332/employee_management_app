

import 'package:employee_management_app/src/domain/domain.dart';

abstract class DatabaseRepository {
  Future<List<EmployeeModel>> getSavedEmployees();
  Future<void> saveEmployee(EmployeeModel employee);
  Future<void> removeEmployee(EmployeeModel employee);
  Future<void> editEmployee(EmployeeModel employee);
}