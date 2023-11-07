import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:employee_management_app/src/utils/utils.dart';

import '../presentation/pages/pages.dart';

abstract class AppRouter {
  static final router = GoRouter(routes: <RouteBase>[
    GoRoute(
        path: '/',
        name: AppRoutes.rootRouteName,
        redirect: ((context, state) =>
            state.namedLocation(AppRoutes.homeRoute))),
    GoRoute(
        path: '/home',
        name: AppRoutes.homeRoute,
        pageBuilder: (context, state) =>
            const MaterialPage<void>(child: HomePage()),
        routes: const[
          
        ] )
  ]);
}