import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:misis/screens/named_screen.dart';

final class NavBarConfiguration {
  static final List<StatefulShellBranch> branches = [
    StatefulShellBranch(
      routes: <RouteBase>[
        GoRoute(
          name: 'schedule',
          path: '/schedule',
          builder: (BuildContext context, GoRouterState state) =>
              const EmptyScreen(title: "Schedule"),
          // routes: <RouteBase>[],
          // redirect: (context, state) {}, // здесь делать проверку на логиорвание
        ),
      ],
    ),
    StatefulShellBranch(
      routes: <RouteBase>[
        GoRoute(
          name: 'settings',
          path: '/settings',
          builder: (BuildContext context, GoRouterState state) =>
              const EmptyScreen(title: "Settings"),
          // routes: <RouteBase>[],
        ),
      ],
    ),
  ];
}
