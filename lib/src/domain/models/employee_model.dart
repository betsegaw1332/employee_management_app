// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

import 'package:employee_management_app/src/utils/utils.dart';

@Entity(tableName: AppStrings.employeeTableName)
class EmployeeModel extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String? employeeName;
  final String? employeeRole;
  final String? startingDate;
  final String? endDate;
  const EmployeeModel({
    this.id,
    this.employeeName,
    this.employeeRole,
    this.startingDate,
    this.endDate,
  });

  factory EmployeeModel.fromMap(Map<String, dynamic> map) {
    return EmployeeModel(
      id: map['id'] != null ? map['id'] as int : null,
      employeeName:
          map['employeeName'] != null ? map['employeeName'] as String : null,
      employeeRole:
          map['employeeRole'] != null ? map['employeeRole'] as String : null,
      startingDate:
          map['startingDate'] != null ? map['startingDate'] as String : null,
      endDate: map['endDate'] != null ? map['endDate'] as String : null,
    );
  }

  factory EmployeeModel.fromJson(String source) =>
      EmployeeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id!,
      employeeName!,
      employeeRole!,
      startingDate!,
      endDate!,
    ];
  }
}
