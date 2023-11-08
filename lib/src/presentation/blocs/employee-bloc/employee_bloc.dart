import 'package:employee_management_app/service_locator.dart';
import 'package:employee_management_app/src/data/data.dart';
import 'package:employee_management_app/src/domain/domain.dart';
import 'package:employee_management_app/src/presentation/blocs/employee-bloc/employee.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final DatabaseRepository _databaseRepository;

  EmployeeBloc()
      : _databaseRepository = serviceLocator<DatabaseRepositoryImpl>(),
        super(EmployeeInit()) {
    on<FetchStoredEmployees>(_fetchStoredEmployees);
    on<AddEmployee>(_addEmployee);
    on<RemoveEmployee>(_removeEmployee);
    on<UpdateEmployee>(_updateEmployee);
  }
  List<EmployeeModel> savedEmployeesCache = [];

  Future<void> _fetchStoredEmployees(FetchStoredEmployees fetchStoredEmployees,
      Emitter<EmployeeState> emit) async {
    emit(EmployeeInProgress());

    try {
      final storedEmployees = await _databaseRepository.getSavedEmployees();
      savedEmployeesCache = storedEmployees;

      emit(EmployeesLoadedFromLocal(employees: storedEmployees));
    } catch (e) {
      emit(EmployeeFailed(errorMessage: e.toString()));
    }
  }

  Future<void> _addEmployee(
      AddEmployee saveEmployee, Emitter<EmployeeState> emit) async {
    emit(EmployeeInProgress());

    try {
      await _databaseRepository.saveEmployee(saveEmployee.employee);

      emit(EmployeeInProgress());
      add(FetchStoredEmployees());
    } catch (e) {
      emit(EmployeeFailed(errorMessage: e.toString()));
    }
  }

  Future<void> _updateEmployee(
      UpdateEmployee updateEmployee, Emitter<EmployeeState> emit) async {
    emit(EmployeeInProgress());

    try {
      await _databaseRepository.editEmployee(updateEmployee.employee);

      emit(EmployeeInProgress());
      add(FetchStoredEmployees());
    } catch (e) {
      emit(EmployeeFailed(errorMessage: e.toString()));
    }
  }

  Future<void> _removeEmployee(
      RemoveEmployee removeEmployee, Emitter<EmployeeState> emit) async {
    emit(EmployeeInProgress());
    await _databaseRepository.removeEmployee(removeEmployee.employee);

    emit(EmployeeDeleted());
  }
}
