import 'package:go_router/go_router.dart';
import 'package:misis/models/user.dart';

final class LoginRouter {
  static final List<RouteBase> loginRoutes = [
     GoRoute(
      path: 'filial',
      builder: (context, state) {
        // Здесь надо будет бильдить ViewModel для филиалов. Она будет отвечать за бизнес логику.
        return ListingSelection();
      },
    ),
    GoRoute(
      path: 'status/:filial',
      builder: (context, state) {
        final selectedFilial = state.pathParameters['filial'];
        return StatusScreen(selectedFilial);
      },
    ),
      GoRoute(
      path: 'group/:filial',
      builder: (context, state) {
        var selectedParams = state.pathParameters;
        selectedParams['status'] = Status.student.toString();
        // Здесь надо будет бильдить ViewModel для групп. Она будет отвечать за бизнес логику.
        return ListingSelection(selectedParams);
      },
    ),
      GoRoute(
      path: 'name/:filial',
      builder: (context, state) {
        var selectedParams = state.pathParameters;
        selectedParams['status'] = Status.teacher.toString();
        // Здесь надо будет бильдить ViewModel для преподов. Она будет отвечать за бизнес логику.
        return ListingSelection(selectedParams);
      },
    )
  ];
}