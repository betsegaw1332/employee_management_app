import 'package:employee_management_app/src/domain/domain.dart';
import 'package:employee_management_app/src/presentation/blocs/blocs.dart';
import 'package:employee_management_app/src/presentation/pages/list-employee/components/emoloyee_list_builder.dart';
import 'package:employee_management_app/src/presentation/pages/list-employee/components/emoloyee_tile.dart';
import 'package:employee_management_app/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListEmployeeBody extends StatefulWidget {
  const ListEmployeeBody({super.key});

  @override
  State<ListEmployeeBody> createState() => _ListEmployeeBodyState();
}

class _ListEmployeeBodyState extends State<ListEmployeeBody> {
  final _currentEmpoyeesDataNotifier = ValueNotifier(<EmployeeModel>[]);
  final _previousEmployeesDataNotifier = ValueNotifier(<EmployeeModel>[]);
  final _allEmployeesDataNotifier = ValueNotifier(<EmployeeModel>[]);

  EmployeeModel? deletedCache;
  _onEmployeeLoaded({required List<EmployeeModel> employees}) {
    _allEmployeesDataNotifier.value = employees;
  }

  _onCurrentEmployeeUpdated({required List<EmployeeModel> employees}) {
    _currentEmpoyeesDataNotifier.value = employees;
  }

  _onPreviousEmployeeUpdated({required List<EmployeeModel> employees}) {
    _previousEmployeesDataNotifier.value = employees;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmployeeBloc, EmployeeState>(
      listener: (context, state) {
        if (state is EmployeesLoadedFromLocal) {
          List<EmployeeModel> currentEmoloyees = [];
          List<EmployeeModel> previousEmployees = [];

          for (var employee in state.employees) {
            if (employee.endDate != null && employee.endDate!.isNotEmpty) {
              previousEmployees.add(employee);
            } else {
              currentEmoloyees.add(employee);
            }
          }

          _onEmployeeLoaded(employees: state.employees);
          _onCurrentEmployeeUpdated(employees: currentEmoloyees);
          _onPreviousEmployeeUpdated(employees: previousEmployees);
        }
      },
      builder: ((context, state) {
        if (state is EmployeeInProgress) {
          return CircularProgressIndicator(
            color: AppColors.appPrimaryColor,
          );
        } else if (state is EmployeeFailed) {
          return Center(
            child:
                Text("${AppStrings.fetchFailureMessage} ${state.errorMessage}"),
          );
        } else if (state is EmployeeDeleted) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            final snackBar = SnackBar(
                content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(AppStrings.employeeDeletedMessage),
                TextButton(
                    onPressed: deletedCache != null
                        ? () {
                            context
                                .read<EmployeeBloc>()
                                .add(AddEmployee(employee: deletedCache!));

                            deletedCache = null;
                          }
                        : () {},
                    child: Text(
                      AppStrings.undoText,
                      style: TextStyle(color: AppColors.appPrimaryColor),
                    ))
              ],
            ));
            ScaffoldMessenger.of(context)
                .showSnackBar(snackBar)
                .closed
                .then((value) => context.read<EmployeeBloc>().add(FetchStoredEmployees()));
          });
        }

        return Stack(
          children: [
            SingleChildScrollView(
              child: ValueListenableBuilder<List<EmployeeModel>>(
                  valueListenable: _allEmployeesDataNotifier,
                  builder: ((context, employeeData, child) {
                    return employeeData.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: .25.sh,
                                ),
                                SvgPicture.asset(
                                  AppImages.noRecordImage,
                                ),
                                Text(
                                  AppStrings.noRecordFoundText,
                                  style: TextStyle(
                                      color: AppColors.lightBlackColor,
                                      fontSize: 15.5.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 50.h,
                                )
                              ],
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.only(bottom: 40.h),
                            child: Column(
                              children: [
                                ValueListenableBuilder(
                                    valueListenable:
                                        _currentEmpoyeesDataNotifier,
                                    builder: ((context, employees, child) {
                                      return EmployeeListBuilder(
                                        onDelete: (index) {
                                          deletedCache =
                                              _currentEmpoyeesDataNotifier
                                                  .value[index];

                                          final updatedData =
                                              _currentEmpoyeesDataNotifier.value
                                                  .where((i) =>
                                                      _currentEmpoyeesDataNotifier
                                                          .value
                                                          .indexOf(i) !=
                                                      index)
                                                  .toList();
                                          context.read<EmployeeBloc>().add(
                                              RemoveEmployee(
                                                  employee:
                                                      _currentEmpoyeesDataNotifier
                                                          .value[index]));
                                          _onCurrentEmployeeUpdated(
                                              employees: updatedData);
                                        },
                                        employees: employees,
                                        title: AppStrings.currentEmployeesText,
                                      );
                                    })),
                                ValueListenableBuilder(
                                    valueListenable:
                                        _previousEmployeesDataNotifier,
                                    builder: ((context, employees, child) {
                                      return EmployeeListBuilder(
                                        onDelete: (index) {
                                          deletedCache =
                                              _previousEmployeesDataNotifier
                                                  .value[index];
                                          final updatedData =
                                              _previousEmployeesDataNotifier
                                                  .value
                                                  .where((i) =>
                                                      _previousEmployeesDataNotifier
                                                          .value
                                                          .indexOf(i) !=
                                                      index)
                                                  .toList();

                                          context.read<EmployeeBloc>().add(
                                              RemoveEmployee(
                                                  employee:
                                                      _previousEmployeesDataNotifier
                                                          .value[index]));
                                          _onPreviousEmployeeUpdated(
                                              employees: updatedData);
                                        },
                                        employees: employees,
                                        title: AppStrings.previousEmployeesText,
                                      );
                                    })),
                              ],
                            ),
                          );
                  })),
            ),
            _allEmployeesDataNotifier.value.isEmpty
                ? const SizedBox.shrink()
                : Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 1.sw,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      color: AppColors.greyLighterColor,
                      child: Text(
                        AppStrings.swipeLeftText,
                        style: TextStyle(color: AppColors.greyColor),
                      ),
                    ),
                  )
          ],
        );
      }),
    );
  }
}
