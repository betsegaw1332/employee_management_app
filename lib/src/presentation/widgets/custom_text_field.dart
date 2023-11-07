import 'package:employee_management_app/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final Function()? onTap;
  final TextEditingController controller;
  const CustomTextField(
      {super.key,
      required this.prefixIcon,
      this.suffixIcon,
      required this.controller,
      this.onTap,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon == null
            ? const SizedBox.shrink()
            : Icon(
                suffixIcon!,
                color: AppColors.appPrimaryColor,
                size: AppNumbers.arrowIconSize.h,
              ),
        prefixIcon: Icon(
          prefixIcon,
          color: AppColors.appPrimaryColor,
        ),
        hintStyle:
            TextStyle(color: AppColors.greyColor, fontWeight: FontWeight.w400),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyLighterColor),
          borderRadius: BorderRadius.circular(5.sp),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyLighterColor),
          borderRadius: BorderRadius.circular(5.sp),
        ),
      ),
    );
  }
}
