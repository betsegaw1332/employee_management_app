import 'package:employee_management_app/src/presentation/pages/add-employee/components/date_selector_dialg.dart';
import 'package:employee_management_app/src/presentation/widgets/widgets.dart';
import 'package:employee_management_app/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddEmployeeBody extends StatefulWidget {
  const AddEmployeeBody({super.key});

  @override
  State<AddEmployeeBody> createState() => _AddEmployeeBodyState();
}

class _AddEmployeeBodyState extends State<AddEmployeeBody> {
  final employeeNameController = TextEditingController();
  final selectedRoleController = TextEditingController();
  final todayController = TextEditingController();
  final noDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppNumbers.pageHorizontalPadding.w,
          vertical: AppNumbers.pageVerticalPadding.h),
      child: Column(
        children: [
          CustomTextField(
            controller: employeeNameController,
            prefixIcon: Icons.person_outline,
            hintText: AppStrings.employeeNameText,
          ),
          SizedBox(
            height: AppNumbers.verticalSpacing.h,
          ),
          CustomTextField(
            suffixIcon: Icons.arrow_drop_down,
            controller: selectedRoleController,
            prefixIcon: Icons.work_outline,
            hintText: AppStrings.selectRoleText,
          ),
          SizedBox(
            height: AppNumbers.verticalSpacing.h,
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return const DateSelectorDialog(
                            isFromDateSelector: true,
                          );
                        });
                  },
                  controller: todayController,
                  prefixIcon: Icons.event,
                  hintText: AppStrings.todayText,
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              Icon(
                Icons.arrow_right_alt,
                color: AppColors.appPrimaryColor,
              ),
              SizedBox(
                width: 2.w,
              ),
              Expanded(
                child: CustomTextField(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return const DateSelectorDialog(
                            isFromDateSelector: false,
                          );
                        });
                  },
                  controller: noDateController,
                  prefixIcon: Icons.event,
                  hintText: AppStrings.noDateText,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
