import 'package:employee_management_app/src/utils/utils.dart';
import 'package:flutter/material.dart';

abstract class AppColors {
  static final Color appPrimaryColor =
      HexColor.fromHex(AppStrings.primaryColor);
  static final Color appSecondaryColor =
      HexColor.fromHex(AppStrings.secondaryColor);

  static final Color appBackgroundColor =
      HexColor.fromHex(AppStrings.appBackgroundColor);
  static final Color appShadowColor =
      HexColor.fromHex(AppStrings.appShadowColor);
  static final Color textFieldFillColor =
      HexColor.fromHex(AppStrings.textFieldFillColor);
}