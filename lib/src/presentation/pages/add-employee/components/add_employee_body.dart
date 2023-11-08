import 'package:employee_management_app/src/domain/domain.dart';
import 'package:employee_management_app/src/presentation/blocs/blocs.dart';
import 'package:employee_management_app/src/presentation/pages/add-employee/components/add_employee_actions.dart';
import 'package:employee_management_app/src/presentation/pages/add-employee/components/date_selector_dialg.dart';
import 'package:employee_management_app/src/presentation/pages/add-employee/components/roles_sliding_panel.dart';
import 'package:employee_management_app/src/presentation/widgets/widgets.dart';
import 'package:employee_management_app/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AddEmployeeBody extends StatefulWidget {
  final EmployeeModel? employeeData;
  const AddEmployeeBody({super.key, this.employeeData});

  @override
  State<AddEmployeeBody> createState() => _AddEmployeeBodyState();
}

class _AddEmployeeBodyState extends State<AddEmployeeBody> {
  DateTime startingDate = DateTime.now();
  DateTime? endDate;

  final employeeNameController = TextEditingController();
  final selectedRoleController = TextEditingController();
  final todayController = TextEditingController(text: AppStrings.todayText);
  final noDateController = TextEditingController();
  final panelController = PanelController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.employeeData != null) {
      DateTime startingTempDate = DateFormat("yyyy-MM-dd hh:mm:ss")
          .parse(widget.employeeData!.startingDate!);
      startingDate = startingTempDate;
      DateTime endTempDate = widget.employeeData!.endDate != null &&
              widget.employeeData!.endDate!.isNotEmpty
          ? DateFormat("yyyy-MM-dd hh:mm:ss")
              .parse(widget.employeeData!.endDate!)
          : DateTime.now();
      endDate = widget.employeeData!.endDate != null &&
              widget.employeeData!.endDate!.isNotEmpty
          ? endTempDate
          : null;
      employeeNameController.text = widget.employeeData!.employeeName!;
      selectedRoleController.text = widget.employeeData!.employeeRole!;
      todayController.text =
          AppHelperFunctions.formatDate(dateTime: startingTempDate);
      noDateController.text = widget.employeeData!.endDate != null &&
              widget.employeeData!.endDate!.isNotEmpty
          ? AppHelperFunctions.formatDate(dateTime: endTempDate)
          : '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RolesSlidingPanel(
      onTap: (selectedRole) {
        selectedRoleController.text = selectedRole;
      },
      controller: panelController,
      panelBody: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppNumbers.pageHorizontalPadding.w,
            vertical: AppNumbers.pageVerticalPadding.h),
        child: Form(
          key: _formKey,
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
                isReadOnly: true,
                onTap: () {
                  panelController.open();
                },
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
                      isReadOnly: true,
                      hasValidator: false,
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const DateSelectorDialog(
                                isFromDateSelector: true,
                              );
                            }).then((value) {
                          if (value != null) {
                            (value as DateTime).day == DateTime.now().day
                                ? todayController.text = AppStrings.todayText
                                : todayController.text =
                                    AppHelperFunctions.formatDate(
                                        dateTime: value);

                            setState(() {
                              startingDate = value;
                            });
                          }
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
                      hasValidator: false,
                      isReadOnly: true,
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const DateSelectorDialog(
                                isFromDateSelector: false,
                              );
                            }).then((value) {
                          if (value != null) {
                            noDateController.text =
                                AppHelperFunctions.formatDate(dateTime: value);
                            setState(() {
                              endDate = value;
                            });
                          } else {
                            noDateController.text = '';
                            setState(() {
                              endDate = null;
                            });
                          }
                        });
                      },
                      controller: noDateController,
                      prefixIcon: Icons.event,
                      hintText: AppStrings.noDateText,
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: SizedBox(
                height: 1.h,
              )),
              BlocConsumer<EmployeeBloc, EmployeeState>(
                  listener: (context, state) {
                if (state is EmployeesLoadedFromLocal &&
                    widget.employeeData == null) {
                  const snackBar = SnackBar(
                    content: Text(AppStrings.employeAddedMessage),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              }, builder: ((context, state) {
                return state is EmployeeInProgress
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : const SizedBox.shrink();
              })),
              AddEmployeeActions(onSave: () {
                final validated = _formKey.currentState!.validate();
                if (validated) {
                  final employee = EmployeeModel(
                      id: widget.employeeData != null
                          ? widget.employeeData!.id!
                          : null,
                      employeeName: employeeNameController.text,
                      employeeRole: selectedRoleController.text,
                      startingDate: todayController.text == AppStrings.todayText
                          ? DateTime.now().toString()
                          : startingDate.toString(),
                      endDate: noDateController.text.isEmpty
                          ? ''
                          : endDate.toString());
                  if (widget.employeeData == null) {
                    context
                        .read<EmployeeBloc>()
                        .add(AddEmployee(employee: employee));
                  } else {
                    context
                        .read<EmployeeBloc>()
                        .add(UpdateEmployee(employee: employee));
                    Navigator.pop(context);
                  }
                }
              }, onCancel: () {
                Navigator.pop(context);
              }),
              SizedBox(
                height: .07.sh,
              )
            ],
          ),
        ),
      ),
    );
  }
}
