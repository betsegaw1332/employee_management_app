import 'package:employee_management_app/src/presentation/widgets/widgets.dart';
import 'package:employee_management_app/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddEmployeeActions extends StatelessWidget {
  final VoidCallback onSave;
  final VoidCallback onCancel;
  const AddEmployeeActions(
      {super.key, required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 1.5, color: AppColors.greyLighterColor),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
       const   Expanded(
            flex: 2,
            child:  SizedBox(),
          ),
          Expanded(
            flex: 1,
            child: AppButton(
              isActive: false,
              onPressed: onCancel,
              buttonName: AppStrings.cancelText,
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          Expanded(
            flex: 1,
            child: AppButton(
              isActive: true,
              onPressed: onSave,
              buttonName: AppStrings.saveText,
            ),
          ),
        ],
      ),
    );
  }
}
