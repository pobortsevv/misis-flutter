import 'package:go_router/go_router.dart';
import 'package:misis/models/user.dart';
import 'package:misis/screens/button_screen.dart';

final class LoginRouter {
  static final List<RouteBase> loginRoutes = [
    GoRoute(
      name: 'filial',
      path: '/login/filial',
      builder: (context, state) {
        return const ButtonScreen(title: "select filial", nextScreen: "status");
      },
    ),
    GoRoute(
      name: 'status',
      path: '/login/status',
      builder: (context, state) {
        return const ButtonScreen(title: "select status", nextScreen: "group");
      },
    ),
    GoRoute(
      name: 'group',
      path: '/login/group',
      builder: (context, state) {
        return const ButtonScreen(title: "select group", nextScreen: "schedule");
      },
    ),
    GoRoute(
      name: 'teacher',
      path: '/login/teacher',
      builder: (context, state) {
        return const ButtonScreen(title: "teacher login", nextScreen: "schedule");
      },
    ),
  ];
}