/// Доменная модель группы
final class Group {
  final int id;
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
}