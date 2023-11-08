import 'package:employee_management_app/src/domain/domain.dart';
import 'package:equatable/equatable.dart';

abstract class EmployeeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchStoredEmployees extends EmployeeEvent {}

class AddEmployee extends EmployeeEvent {
  final EmployeeModel employee;

  AddEmployee({required this.employee});

  @override
  List<Object?> get props => [employee];
}

class UpdateEmployee extends EmployeeEvent {
  final EmployeeModel employee;

  UpdateEmployee({required this.employee});

  @override
  List<Object?> get props => [employee];
}

class RemoveEmployee extends EmployeeEvent {
  final EmployeeModel employee;

  RemoveEmployee({required this.employee});

  @override
  List<Object?> get props => [employee];
}