import 'package:employee_management_app/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonName;
  final bool isActive;
  const AppButton(
      {super.key,
      required this.buttonName,
      required this.onPressed,
      this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            foregroundColor:isActive? Colors.white:AppColors.appPrimaryColor,
            backgroundColor: isActive
                ? AppColors.appPrimaryColor
                : AppColors.primaryColorLighter,
            padding: EdgeInsets.symmetric(vertical: 9.h),
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(AppNumbers.buttonBorderRadius.sp))),
        onPressed: onPressed,
        child: Text(buttonName));
  }
}
