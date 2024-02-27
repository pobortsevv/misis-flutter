import 'package:go_router/go_router.dart';
import 'package:misis/router/login_router.dart';

final class AppRouter {
  static final shared = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: 'schedule',
        path: '/schedule',
        builder: (context, state) {
          final viewModel = ScheduleViewModel(); // Она будет отвечать за бизнес логику.
          return Schedule(viewModel);
        },
      ),
      GoRoute(
        path: '/login', // По сути первый экран логина - выбор филиала.
        builder: (context, state) {
          // Здесь надо будет бильдить ViewModel для филиалов. Она будет отвечать за бизнес логику.
          return ListingSelection();
        },
        routes: LoginRouter.loginRoutes
      ),
    ],
  );
}