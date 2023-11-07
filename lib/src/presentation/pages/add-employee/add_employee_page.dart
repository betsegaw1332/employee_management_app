
import 'package:employee_management_app/src/presentation/pages/add-employee/components/add_employee_body.dart';
import 'package:employee_management_app/src/utils/utils.dart';
import 'package:flutter/material.dart';

class AddEmployeePage extends StatelessWidget {
  const AddEmployeePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(AppStrings.addEmployeeTitle),
        
      ),
      body: const AddEmployeeBody(),
    );
  }
}
