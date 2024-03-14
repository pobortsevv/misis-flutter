import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:misis/models/Domain/filial.dart';
import 'package:misis/models/Domain/teacher.dart';
import 'package:misis/models/profile.dart';
import 'package:misis/models/user.dart';
import 'package:misis/profile_manager/profile_manager.dart';
import 'package:misis/provider/provider.dart';
import 'package:misis/screens/list_screen/view_models/list_view_model.dart';

final class TeachersViewModel extends ListViewModel<Teacher> {
  @override
  final String title = 'Выберите своё ФИО';
  final AppProvider provider;
  final ProfileManager profileManager;
  late final Future<List<Teacher>> teachers;
  final Filial selectedFilial;

  TeachersViewModel({required this.selectedFilial, required this.provider, required this.profileManager});

  @override
  Future<List<Teacher>> getModelsList() {
    teachers = provider.fetchTeachers(selectedFilial.id);

    return teachers;
  }

  @override
  void onTap(int id, BuildContext context) async {
    final teachers = await this.teachers;
    final selectedTeacher = teachers.firstWhere((element) => element.id == id);
    final selectedProfile = _makeProfile(selectedTeacher);

    await profileManager.addProfile(selectedProfile);

    if (context.mounted) context.goNamed(TeachersRoute.schedule.name);
  }

  Profile _makeProfile(Teacher selectedTeacher) {
    final selectedUser = User(Status.teacher, selectedTeacher);
    final selectedProfile = Profile(filial: selectedFilial, user: selectedUser);

    return selectedProfile;
  }
}

enum TeachersRoute {
  schedule
}