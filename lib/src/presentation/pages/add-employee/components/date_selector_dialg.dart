import 'package:employee_management_app/src/presentation/pages/add-employee/components/date_selector_actions.dart';
import 'package:employee_management_app/src/presentation/widgets/widgets.dart';
import 'package:employee_management_app/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

class DateSelectorDialog extends StatefulWidget {
  const DateSelectorDialog(
      {super.key,
      required this.isFromDateSelector,});
  final bool isFromDateSelector;
  @override
  State<DateSelectorDialog> createState() => _DateSelectorDialogState();
}

class _DateSelectorDialogState extends State<DateSelectorDialog> {
  DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();
  bool timePickerEnabled = false;
  Duration duration = const Duration(hours: 1, minutes: 23);
  int selectedButtonIndex = 0;

  _updateSlectedButtonIndex({required int index}) {
    setState(() {
      selectedButtonIndex = index;
    });
  }

  @override
  void initState() {
    if (widget.isFromDateSelector) {
      _selectedDay = DateTime.now();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppNumbers.appBorderRadius.sp)),
        margin: EdgeInsets.symmetric(
            vertical: widget.isFromDateSelector ? .15.sh : .18.sh,
            horizontal: 20.w),
        child: Column(
          children: [
            widget.isFromDateSelector
                ? Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: AppButton(
                            isActive: selectedButtonIndex == 0,
                            onPressed: () {
                              setState(() {
                                _selectedDay = DateTime.now();
                                _focusedDay = DateTime
                                    .now(); // update `_focusedDay` here as well
                              });
                              _updateSlectedButtonIndex(index: 0);
                            },
                            buttonName: AppStrings.todayText,
                          )),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                              child: AppButton(
                            isActive: selectedButtonIndex == 1,
                            onPressed: () {
                              final today = DateTime.now();
                              final nextMonday = today.next(DateTime.monday);
                              _selectedDay = nextMonday;
                              _focusedDay = nextMonday;
                              _updateSlectedButtonIndex(index: 1);
                            },
                            buttonName: AppStrings.nextMondayText,
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: AppButton(
                            isActive: selectedButtonIndex == 2,
                            onPressed: () {
                              final today = DateTime.now();
                              final nextTuesday = today.next(DateTime.tuesday);
                              if (nextTuesday == today) {
                                final updatedNextTuesday =
                                    today.add(const Duration(days: 7));
                                _selectedDay = updatedNextTuesday;
                                _focusedDay = updatedNextTuesday;
                              } else {
                                _selectedDay = nextTuesday;
                                _focusedDay = nextTuesday;
                              }

                              _updateSlectedButtonIndex(index: 2);
                            },
                            buttonName: AppStrings.nextTuesdayText,
                          )),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                              child: AppButton(
                            isActive: selectedButtonIndex == 3,
                            onPressed: () {
                              final today = DateTime.now();
                              final nextWeek =
                                  today.add(const Duration(days: 7));
                              _selectedDay = nextWeek;
                              _focusedDay = nextWeek;
                              _updateSlectedButtonIndex(index: 3);
                            },
                            buttonName: AppStrings.afterOneWeekText,
                          )),
                        ],
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: AppButton(
                            isActive: selectedButtonIndex == 0,
                            onPressed: () {
                              setState(() {
                                _selectedDay = null;
                                _focusedDay = DateTime
                                    .now(); // update `_focusedDay` here as well
                              });
                              _updateSlectedButtonIndex(index: 0);
                            },
                            buttonName: AppStrings.noDateText,
                          )),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                              child: AppButton(
                            isActive: selectedButtonIndex == 1,
                            onPressed: () {
                              setState(() {
                                _selectedDay = DateTime.now();
                                _focusedDay = DateTime
                                    .now(); // update `_focusedDay` here as well
                              });
                              _updateSlectedButtonIndex(index: 1);
                            },
                            buttonName: AppStrings.todayText,
                          )),
                        ],
                      ),
                    ],
                  ),
            Flexible(
              child: Material(
                color: Colors.white,
                child: TableCalendar(
                  startingDayOfWeek: StartingDayOfWeek.sunday,
                  calendarStyle: CalendarStyle(
                    todayTextStyle: TextStyle(color: AppColors.appPrimaryColor),
                    todayDecoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppColors.appPrimaryColor),
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: AppColors.appPrimaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  headerStyle: HeaderStyle(
                      headerPadding: EdgeInsets.zero,
                      headerMargin: EdgeInsets.symmetric(horizontal: 35.w),
                      titleTextStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600),
                      leftChevronIcon: Icon(
                        Icons.arrow_left,
                        size: AppNumbers.arrowIconSize.h,
                        color: AppColors.greyColor,
                      ),
                      rightChevronIcon: Icon(
                        Icons.arrow_right,
                        size: AppNumbers.arrowIconSize.h,
                        color: AppColors.greyColor,
                      ),
                      formatButtonVisible: false,
                      titleCentered: true),
                  firstDay: DateTime.utc(1990, 10, 16),
                  lastDay: DateTime.utc(2050, 3, 14),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay =
                          focusedDay; // update `_focusedDay` here as well
                    });
                  },
                ),
              ),
            ),
            Divider(
              color: AppColors.greyLighterColor,
            ),
            DateSelectorActions(
              selectedDate: _selectedDay,
              onCancel: () {
                Navigator.pop(context);
              },
              onSave: () {
                Navigator.pop(context, _selectedDay);
              },
            )
          ],
        ));
  }
}
