import 'package:employee_management_app/src/domain/domain.dart';
import 'package:employee_management_app/src/presentation/blocs/blocs.dart';
import 'package:employee_management_app/src/presentation/pages/add-employee/components/add_employee_body.dart';
import 'package:employee_management_app/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddEmployeePage extends StatelessWidget {
  final EmployeeModel? employeeData;
  const AddEmployeePage({
    super.key,
    this.employeeData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          employeeData != null
              ? Padding(
                  padding: EdgeInsets.only(right: 15.w),
                  child: GestureDetector(
                    onTap: () {
                      context
                          .read<EmployeeBloc>()
                          .add(RemoveEmployee(employee: employeeData!));
                      const snackBar = SnackBar(
                        content: Text(AppStrings.employeeDeletedMessage),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.delete),
                  ),
                )
              : const SizedBox.shrink()
        ],
        automaticallyImplyLeading: false,
        title: Text(employeeData != null
            ? AppStrings.editEmployeeTitle
            : AppStrings.addEmployeeTitle),
      ),
      body: AddEmployeeBody(
        employeeData: employeeData,
      ),
    );
  }
}
