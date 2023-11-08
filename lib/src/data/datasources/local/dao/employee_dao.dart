import 'package:employee_management_app/src/domain/domain.dart';
import 'package:employee_management_app/src/utils/utils.dart';
import 'package:floor/floor.dart';

@dao
abstract class EmployeeDao {
  @Query('SELECT * FROM ${AppStrings.employeeTableName}')
  Future<List<EmployeeModel>> getAllEmployees();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertEmployee(EmployeeModel employee);

  @delete
  Future<void> deleteEmployee(EmployeeModel employee);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateEmployee(EmployeeModel employee);
}
