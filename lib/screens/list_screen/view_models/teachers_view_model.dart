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
  late List<Teacher> _allTeachers;

  final AppProvider _provider;
  final ProfileManager _profileManager;
  final Filial _selectedFilial;

  TeachersViewModel({
    required Filial selectedFilial,
    required AppProvider provider,
    required ProfileManager profileManager
  }) : _selectedFilial = selectedFilial, _provider = provider, _profileManager = profileManager;

  @override
  void loadData() {
    notify(LoadingEvent(isLoading: true));
    _provider.fetchTeachers(_selectedFilial.id).then((value) {
      _allTeachers = value;
      notify(ListDataLoadedEvent(data: value));
    }).catchError((onError) {
      notify(LoadingErrorEvent(error: onError));
    });
  }

  @override
  void onTap(int id, BuildContext context) async {
    final teachers = _allTeachers;
    final selectedTeacher = teachers.firstWhere((element) => element.id == id);
    final selectedProfile = _makeProfile(selectedTeacher);

    await _profileManager.addProfile(selectedProfile);

    if (context.mounted) context.goNamed(TeachersRoute.schedule.name);
  }

  Profile _makeProfile(Teacher selectedTeacher) {
    final selectedUser = User(Status.teacher, selectedTeacher);
    final selectedProfile = Profile(filial: _selectedFilial, user: selectedUser);

    return selectedProfile;
  }
  
  @override
  void searchListener(String text) {
    final foundTeachers = _allTeachers
        .where((item) => item.name.toLowerCase().contains(text.toLowerCase()))
        .toList();
    notify(SearchEvent(foundData: foundTeachers));
  }
}

enum TeachersRoute {
  schedule
}