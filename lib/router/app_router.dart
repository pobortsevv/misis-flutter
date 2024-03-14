import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:misis/profile_manager/profile_manager.dart';
import 'package:misis/provider/provider.dart';
import 'package:misis/router/login_router.dart';
import 'package:misis/screens/named_screen.dart';
import 'package:misis/screens/root/nav_bar.dart';

final class AppRouter {
  AppProvider provider;
  ProfileManager profileManager;
  late GoRouter rootRouter;

  AppRouter(this.profileManager, this.provider) {
    rootRouter = _makeRouter(profileManager);
  }

  GoRouter _makeRouter(ProfileManager profileManager) {
    return GoRouter(
      initialLocation: '/schedule',
      routes: LoginRouter.makeRoutes(provider, profileManager) +
        [
          StatefulShellRoute.indexedStack(
            builder: (BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
              return ScaffoldNavBar(navigationShell: navigationShell);
            },
            branches: [
              StatefulShellBranch(
                routes: <RouteBase>[
                  GoRoute(
                    name: 'schedule',
                    path: '/schedule',
                    builder: (BuildContext context, GoRouterState state) {
                      _clearContextIfNeeded(context);

                      return const EmptyScreen(title: 'Расписание');
                    },
                    // routes: <RouteBase>[],
                    redirect: (context, state) async {
                      return await profileManager.isLoggedIn() ? '/schedule' : '/login';
                    },
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: <RouteBase>[
                  GoRoute(
                    name: 'settings',
                    path: '/settings',
                    builder: (BuildContext context, GoRouterState state) {
                      _clearContextIfNeeded(context);
                      
                      return const EmptyScreen(title: "Settings");
                    },
                    // routes: <RouteBase>[],
                    redirect: (context, state) async {
                      return await profileManager.isLoggedIn() ? '/settings' : '/login';
                    }
                  ),
                ],
              ),
            ]
          ),
        ],
      // errorBuilder: (context, state) {}, // TODO: Сделать для того, чтобы обрабатывать ошибки роутера
    );
  }

  void _clearContextIfNeeded(BuildContext context) {
    while (context.canPop() == true) {
      context.pop();
    }
  }
}
