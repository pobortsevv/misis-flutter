import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:misis/models/profile.dart';
import 'package:misis/profile_manager/profile_manager.dart';
import 'package:misis/router/app_nav_bar_tabs.dart';
import 'package:misis/router/login_router.dart';
import 'package:misis/screens/named_screen.dart';
import 'package:misis/screens/root/nav_bar.dart';

final class AppRouter {
  ProfileManager profileManager;
  late GoRouter rootRouter;

  AppRouter(this.profileManager) {
    rootRouter = _makeRouter(profileManager);
  }

  GoRouter _makeRouter(ProfileManager profileManager) {
    return GoRouter(
      initialLocation: '/schedule',
      routes: LoginRouter.loginRoutes +
          [
            StatefulShellRoute.indexedStack(
                builder: (BuildContext context, GoRouterState state,
                    StatefulNavigationShell navigationShell) {
                  return ScaffoldNavBar(navigationShell: navigationShell);
                },
                branches: [
                  StatefulShellBranch(
                    routes: <RouteBase>[
                      GoRoute(
                        name: 'schedule',
                        path: '/schedule',
                        builder: (BuildContext context, GoRouterState state) =>
                            const EmptyScreen(title: "Schedule"),
                        // routes: <RouteBase>[],
                        redirect: (context, state) async {
                          final profile = await profileManager.getProfile();

                          if (profile == null) {
                              return '/login';
                          }
                          return '/schedule';
                        }, // здесь делать проверку на логиорвание
                      ),
                    ],
                  ),
                  StatefulShellBranch(
                    routes: <RouteBase>[
                      GoRoute(
                          name: 'settings',
                          path: '/settings',
                          builder:
                              (BuildContext context, GoRouterState state) =>
                                  const EmptyScreen(title: "Settings"),
                          // routes: <RouteBase>[],
                          redirect: (context, state) async {
                            final profile = await profileManager.getProfile();

                            if (profile == null) {
                              return '/login';
                            }
                            return '/schedule';
                          }),
                    ],
                  ),
                ]),
          ],
      // errorBuilder: (context, state) {}, // TODO: Сделать для того, чтобы обрабатывать ошибки роутера
    );
  }
}
