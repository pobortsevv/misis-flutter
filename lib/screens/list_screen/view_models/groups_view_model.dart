import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:misis/models/Domain/filial.dart';
import 'package:misis/models/Domain/group.dart';
import 'package:misis/models/profile.dart';
import 'package:misis/models/user.dart';
import 'package:misis/profile_manager/profile_manager.dart';
import 'package:misis/provider/provider.dart';
import 'package:misis/screens/list_screen/view_models/list_view_model.dart';

final class GroupsViewModel extends ListViewModel<Group> {
  @override
  final String title = 'Выберите группу';
  late List<Group> _allGroups;

  final AppProvider _provider;
  final ProfileManager _profileManager;
  final Filial _selectedFilial;

  GroupsViewModel({
    required Filial selectedFilial,
    required AppProvider provider,
    required ProfileManager profileManager
  }) : _selectedFilial = selectedFilial, _provider = provider, _profileManager = profileManager;

  @override
  void loadData() {
    notify(LoadingEvent(isLoading: true));
    _provider.fetchGroups(_selectedFilial.id).then((value) {
      _allGroups = value;
      notify(ListDataLoadedEvent(data: value));
    }).catchError((onError) {
      notify(LoadingErrorEvent(error: onError));
    });
  }

  @override
  void onTap(int id, BuildContext context) async {
    final groups = _allGroups;
    final selectedGroup = groups.firstWhere((element) => element.id == id);
    final selectedProfile = _makeProfile(selectedGroup);

    await _profileManager.addProfile(selectedProfile);

    if (context.mounted) context.goNamed(StudentsRoute.schedule.name);
  }

  Profile _makeProfile(Group selectedGroup) {
    final selectedUser = User(Status.student, selectedGroup);
    final selectedProfile = Profile(filial: _selectedFilial, user: selectedUser);

    return selectedProfile;
  }
  
  // @override
  // void searchListener(String text) {
  //   // TODO: implement searchListener
  // }
}

enum StudentsRoute {
  schedule
}