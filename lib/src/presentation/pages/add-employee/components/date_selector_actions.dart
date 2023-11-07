import 'package:employee_management_app/src/presentation/widgets/widgets.dart';
import 'package:employee_management_app/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateSelectorActions extends StatelessWidget {
  final DateTime? selectedDate;
  final VoidCallback onCancel;
  final VoidCallback onSave;
  const DateSelectorActions(
      {super.key,
      this.selectedDate,
      required this.onCancel,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: RichText(
                text: TextSpan(children: [
              WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Icon(
                    Icons.event,
                    color: AppColors.appPrimaryColor,
                  )),
              WidgetSpan(
                child: SizedBox(
                  width: 2.w,
                ),
              ),
              WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: selectedDate != null
                      ? Text(
                          AppHelperFunctions.formatDate(
                              dateTime: selectedDate!),
                          style:
                              TextStyle(color: Colors.black, fontSize: 14.sp),
                        )
                      : Text(
                          AppStrings.noDateText,
                          style:
                              TextStyle(color: Colors.black, fontSize: 14.sp),
                        ))
            ]))),
        Expanded(
          flex: 1,
          child: AppButton(
            isActive: false,
            onPressed: () {},
            buttonName: AppStrings.cancelText,
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          flex: 1,
          child: AppButton(
            isActive: true,
            onPressed: () {},
            buttonName: AppStrings.saveText,
          ),
        ),
      ],
    );
  }
}
