final class Room {
  final int id;
  final String name;

  const Room({
    required this.id,
    required this.name
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'name': String name
      } => Room(id: id, name: name),
      _ => throw const FormatException('Failed to load room.')
    };
  }
}