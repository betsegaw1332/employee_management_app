import 'package:employee_management_app/src/domain/domain.dart';
import 'package:employee_management_app/src/presentation/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:employee_management_app/src/utils/utils.dart';

abstract class AppRouter {
  static final router = GoRouter(routes: <RouteBase>[
    GoRoute(
        path: '/',
        name: AppRoutes.rootRouteName,
        redirect: ((context, state) =>
            state.namedLocation(AppRoutes.listEmployeeRoute))),
    GoRoute(
        path: '/list-employee',
        name: AppRoutes.listEmployeeRoute,
        pageBuilder: (context, state) =>
            const MaterialPage<void>(child: ListEmployeePage()),
        routes: [
          GoRoute(
              path: 'add-employee',
              name: AppRoutes.addEmployeeRoute,
              pageBuilder: (context, state) {
                EmployeeModel? employeeData =
                    state.extra == null ? null : state.extra as EmployeeModel;
                return  MaterialPage<void>(
                    child: AddEmployeePage(
                  employeeData: employeeData,
                ));
              }),
        ])
  ]);
}
