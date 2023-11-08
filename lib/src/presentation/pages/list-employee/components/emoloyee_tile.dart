import 'package:employee_management_app/src/domain/domain.dart';
import 'package:employee_management_app/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class EmployeeTile extends StatelessWidget {
  final EmployeeModel emloyeeData;
  const EmployeeTile({
    super.key,
    required this.emloyeeData,
  });

  @override
  Widget build(BuildContext context) {
    DateTime startingDate =
        DateFormat("yyyy-MM-dd hh:mm:ss").parse(emloyeeData.startingDate!);
    DateTime endDate = emloyeeData.endDate != null &&emloyeeData.endDate!.isNotEmpty
        ? DateFormat("yyyy-MM-dd hh:mm:ss").parse(emloyeeData.endDate!)
        : DateTime.now();
    return GestureDetector(
      onTap: () {
        context.goNamed(AppRoutes.addEmployeeRoute, extra: emloyeeData);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5.h,
            ),
            Text(
              emloyeeData.employeeName!,
              style: TextStyle(
                  color: AppColors.lightBlackColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 15.sp),
            ),
            Text(
              emloyeeData.employeeRole!,
              style: TextStyle(
                color: AppColors.greyColor,
                fontSize: 13.sp,
              ),
            ),
            Text(
              emloyeeData.endDate != null && emloyeeData.endDate!.isNotEmpty
                  ? '${AppHelperFunctions.formatDate(dateTime: startingDate)} - ${AppHelperFunctions.formatDate(dateTime: endDate)}'
                  : 'From ${AppHelperFunctions.formatDate(dateTime: startingDate)}  ',
              style: TextStyle(
                color: AppColors.greyColor,
                fontSize: 11.sp,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
          ],
        ),
      ),
    );
  }
}
