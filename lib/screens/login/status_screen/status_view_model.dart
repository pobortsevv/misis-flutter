import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:misis/models/domain/filial.dart';
import 'package:misis/models/domain/user.dart';

final class StatusViewModel {
  final String title = 'Кто вы?';
  final Filial selectedFilial;

  StatusViewModel({required this.selectedFilial});

  void onStudentTap(BuildContext context) {
    final queryParams = {
      'status': Status.student.name
    };

    context.pushNamed(
      StatusRoute.group.name, 
      queryParameters: queryParams,
      extra: selectedFilial
    );
  }

  void onTeacherTap(BuildContext context) {
    final queryParams = {
      'status': Status.teacher.name
    };

    context.pushNamed(
      StatusRoute.teacher.name, 
      queryParameters: queryParams,
      extra: selectedFilial
    );
  }
}

enum StatusRoute {
  group,
  teacher
}