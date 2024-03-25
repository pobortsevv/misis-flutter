import 'package:misis/models/domain/teacher.dart';

final class GetTeachers {
  final Map<String, dynamic> getTeachers;

  const GetTeachers({
    required this.getTeachers
  });

  factory GetTeachers.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'get_teachers': Map<String, dynamic> getTeachers
      } => GetTeachers(getTeachers: getTeachers),
      _ => throw const FormatException('Failed to load teachers.')
    };
  }

  List<Teacher> asDomainModel() {
    final order = getTeachers['order'];

    List<Teacher> teachers = [];
    for (var value in getTeachers.values) {
      if (value is Map<String, dynamic>) {
        teachers.add(Teacher.fromJson(value));
      }
    }

    List<Teacher> orderedTeachers = [];

    for (var id in order) {
      final foundTeacher = teachers.firstWhere((element) => element.id == id);
      orderedTeachers.add(foundTeacher);
    }

    return orderedTeachers;
  }
}