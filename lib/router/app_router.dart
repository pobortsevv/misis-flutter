import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:misis/router/app_nav_bar_tabs.dart';
import 'package:misis/router/login_router.dart';
import 'package:misis/screens/root/nav_bar.dart';

final class AppRouter {
  // Вынести в отдельный класс
  final rootRouter = GoRouter(
    initialLocation: '/login/filial',
    routes: LoginRouter.loginRoutes + [
      StatefulShellRoute.indexedStack(
          builder: (BuildContext context, GoRouterState state,
              StatefulNavigationShell navigationShell) {
            return ScaffoldNavBar(navigationShell: navigationShell);
          },
          branches: NavBarConfiguration.branches),
    ],
  );
}
