import 'package:go_router/go_router.dart';
import 'package:misis/models/Domain/filial.dart';
import 'package:misis/profile_manager/profile_manager.dart';
import 'package:misis/provider/provider.dart';
import 'package:misis/screens/list_screen/list_screen.dart';
import 'package:misis/screens/list_screen/view_models/filials_view_model.dart';
import 'package:misis/screens/list_screen/view_models/groups_view_model.dart';
import 'package:misis/screens/list_screen/view_models/teachers_view_model.dart';
import 'package:misis/screens/status_screen/status_screen.dart';
import 'package:misis/screens/status_screen/status_view_model.dart';

final class LoginRouter {
  final AppProvider _provider;
  final ProfileManager _profileManager;
  late final FilialsViewModel _filialsRootViewModel;

  LoginRouter({
    required AppProvider provider,
    required ProfileManager profileManager
  }) : _provider = provider, _profileManager = profileManager, _filialsRootViewModel = FilialsViewModel(provider: provider);

  List<RouteBase> getRoutes() {
    return [
      GoRoute(
        path: '/login',
        builder: (context, state) {
          return ListScreen(vm: _filialsRootViewModel);
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
                  provider: _provider,
                  profileManager: _profileManager
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
                provider: _provider,
                profileManager: _profileManager
              );

              return ListScreen(vm: vm);
            },
          )
        ]
      ),
    ];
  }
}
