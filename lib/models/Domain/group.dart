import 'package:misis/screens/list_screen/view_models/list_view_model.dart';

/// Доменная модель группы
final class Group implements IdentifiableModel {
  @override
  final int id;
  @override
  final String name;

  const Group({
    required this.id,
    required this.name
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'name': String name
      } => Group(id: id, name: name),
      _ => throw const FormatException('Failed to load group.')
    };
  }
  
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name
    };
  }
}