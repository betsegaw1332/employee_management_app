import 'package:employee_management_app/src/presentation/pages/list-employee/components/list_employee_body.dart';
import 'package:employee_management_app/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListEmployeePage extends StatelessWidget {
  const ListEmployeePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.homePageTitle),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goNamed(AppRoutes.addEmployeeRoute);
        },
        child: const Icon(Icons.add),
      ),
      body: const ListEmployeeBody(),
    );
  }
}
