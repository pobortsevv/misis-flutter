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
  final AppProvider provider;
  final ProfileManager profileManager;
  late final Future<List<Group>> groups;
  final Filial selectedFilial;

  GroupsViewModel({required this.selectedFilial, required this.provider, required this.profileManager});

  @override
  Future<List<Group>> getModelsList() {
    groups = provider.fetchGroups(selectedFilial.id);

    return groups;
  }

  @override
  void onTap(int id, BuildContext context) async {
    final groups = await this.groups;
    final selectedGroup = groups.firstWhere((element) => element.id == id);
    final selectedProfile = _makeProfile(selectedGroup);

    await profileManager.addProfile(selectedProfile);

    if (context.mounted) context.goNamed(StudentsRoute.schedule.name);
  }

  Profile _makeProfile(Group selectedGroup) {
    final selectedUser = User(Status.student, selectedGroup);
    final selectedProfile = Profile(filial: selectedFilial, user: selectedUser);

    return selectedProfile;
  }
}

enum StudentsRoute {
  schedule
}