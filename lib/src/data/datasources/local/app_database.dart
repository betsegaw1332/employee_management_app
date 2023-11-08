import 'package:employee_management_app/src/data/data.dart';
import 'package:employee_management_app/src/domain/domain.dart';
import 'package:floor/floor.dart';
import 'dart:async';


import 'package:sqflite/sqflite.dart' as sqflite;
part 'app_database.g.dart';

@Database(version: 1, entities: [EmployeeModel])
abstract class AppDatabase extends FloorDatabase {
  EmployeeDao get employeeDao;
}