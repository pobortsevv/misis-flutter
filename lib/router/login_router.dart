import 'package:go_router/go_router.dart';
import 'package:misis/models/Domain/filial.dart';
import 'package:misis/profile_manager/profile_manager.dart';
import 'package:misis/provider/provider.dart';
import 'package:misis/screens/list_screen/list_screen.dart';
import 'package:misis/screens/list_screen/view_models/filials_view_model.dart';
import 'package:misis/screens/list_screen/view_models/groups_view_model.dart';
import 'package:misis/screens/list_screen/view_models/teachers_view_model.dart';
import 'package:misis/screens/status_screen/status_screen.dart';
import 'package:misis/screens/status_screen/status_view_models.dart';

final class LoginRouter {
  static List<RouteBase> makeRoutes(AppProvider provider, ProfileManager profileManager) {
    return [
      GoRoute(
        path: '/login',
        builder: (context, state) {
          final vm = FilialsViewModel(provider: provider);

          return ListScreen(vm: vm);
        },
        routes: [
          GoRoute(
            name: 'status',
            path: 'status',
            builder: (context, state) {
              final filial = state.extra as Filial;
              final vm = StatusViewModel(selectedFilial: filial);
              
              return StatusScreen(vm: vm);
            },
          ),
          GoRoute(
            name: 'group',
            path: 'group',
            builder: (context, state) {
              final filial = state.extra as Filial;
              final vm = GroupsViewModel(
                selectedFilial: filial,
                  provider: provider,
                  profileManager: profileManager
                );

              return ListScreen(vm: vm);
            },
          ),
          GoRoute(
            name: 'teacher',
            path: 'teacher',
            builder: (context, state) {
              final filial = state.extra as Filial;
              final vm = TeachersViewModel(
                selectedFilial: filial,
                provider: provider,
                profileManager: profileManager
              );

              return ListScreen(vm: vm);
            },
          )
        ]
      ),
    ];
  }
}
