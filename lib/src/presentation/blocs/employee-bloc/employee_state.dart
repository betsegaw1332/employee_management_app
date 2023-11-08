import 'package:employee_management_app/src/domain/domain.dart';
import 'package:equatable/equatable.dart';

abstract class EmployeeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class EmployeeInit extends EmployeeState {}

class EmployeeInProgress extends EmployeeState {}

class EmployeeSaved extends EmployeeState{}

class EmployeeLoaded extends EmployeeState{}

class EmployeeDeleted extends EmployeeState{}

class EmployeeFailed extends EmployeeState {
  final String errorMessage;
  EmployeeFailed({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class EmployeesLoadedFromLocal extends EmployeeState {
  final List<EmployeeModel> employees;
  EmployeesLoadedFromLocal({required this.employees});

  @override
  List<Object?> get props => [employees];
}