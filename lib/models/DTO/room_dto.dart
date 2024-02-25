import 'package:misis/models/Domain/room.dart';

final class GetRooms {
  final Map<String, dynamic> getRooms;

  const GetRooms({
    required this.getRooms
  });

  factory GetRooms.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'get_rooms': Map<String, dynamic> getRooms
      } => GetRooms(getRooms: getRooms),
      _ => throw const FormatException('Failed to load rooms.')
    };
  }

  List<Room> asDomainModel() {
    final order = getRooms['order'];

    List<Room> rooms = [];
    for (var value in getRooms.values) {
      if (value is Map<String, dynamic>) {
        rooms.add(Room.fromJson(value));
      }
    }

    List<Room> orderedRooms = [];

    for (var id in order) {
      final foundRoom = rooms.firstWhere((element) => element.id == id);
      orderedRooms.add(foundRoom);
    }

    return orderedRooms;
  }
}