import 'package:employee_management_app/src/domain/domain.dart';
import 'package:employee_management_app/src/presentation/pages/list-employee/components/emoloyee_tile.dart';
import 'package:employee_management_app/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class EmployeeListBuilder extends StatelessWidget {
  final List<EmployeeModel> employees;
  final String title;
  final Function(int) onDelete;
  const EmployeeListBuilder(
      {super.key,
      required this.employees,
      required this.title,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          color: AppColors.greyLighterColor,
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: TextStyle(
                color: AppColors.appPrimaryColor,
                fontSize: 14.5.sp,
                fontWeight: FontWeight.w500),
          ),
        ),
        employees.isEmpty
            ? SizedBox(
                height: 40.h,
                child: Center(
                  child: Text(
                    title == AppStrings.currentEmployeesText
                        ? AppStrings.noCurrentEmployeeRecordFoundText
                        : AppStrings.noPreviousEmployeeRecordFoundText,
                    style: TextStyle(color: AppColors.lightBlackColor),
                  ),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: List.generate(
                      employees.length,
                      (index) => GestureDetector(
                            onTap: () {
                              context.goNamed(AppRoutes.addEmployeeRoute,
                                  extra: employees[index]);
                            },
                            child: Dismissible(
                              direction: DismissDirection.endToStart,
                              key: Key(index.toString()),
                              onDismissed: (direction) {
                                onDelete(index);
                              },
                              background: Container(
                                color: Colors.red,
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.only(
                                    right:
                                        20.w), // Background color when swiping
                                child: const Icon(Icons.delete,
                                    color: Colors.white),
                              ),
                              child: EmployeeTile(
                                emloyeeData: employees[index],
                              ),
                            ),
                          )),
                ),
              ),
      ],
    );
  }
}
