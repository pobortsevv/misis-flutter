import 'package:misis/models/Domain/group.dart';

final class GetGroups {
  final Map<String, dynamic> getGroups;

  const GetGroups({
    required this.getGroups
  });

  factory GetGroups.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'get_groups': Map<String, dynamic> getGroups
      } => GetGroups(getGroups: getGroups),
      _ => throw const FormatException('Failed to load groups.')
    };
  }

  List<Group> asDomainModel() {
    final order = getGroups['order'];

    List<Group> groups = [];
    for (var value in getGroups.values) {
      if (value is Map<String, dynamic>) {
        groups.add(Group.fromJson(value));
      }
    }

    List<Group> orderedGroups = [];

    for (var id in order) {
      final foundGroup = groups.firstWhere((element) => element.id == id);
      orderedGroups.add(foundGroup);
    }

    return orderedGroups;
  }
}