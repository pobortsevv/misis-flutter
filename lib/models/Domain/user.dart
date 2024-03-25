import 'package:misis/screens/login/list_screen/view_models/list_view_model.dart';

enum Status {
  student,
  teacher;
}

final class User {
  final Status status;
  /// По сути associated value для Status.
  /// 
  /// Если это преподаватель - храним его ФИО.
  /// Если это студент - храним его группу.
  final IdentifiableModel value;

  const User(this.status, this.value);

  factory User.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'status': String status,
        'value': Map<String, dynamic> value
      } => User(Status.values.byName(status), UserModel.fromJson(value)),
      _ => throw const FormatException('Failed to load user.')
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status.name,
      'value': value.toJson()
    };
  }
}

final class UserModel implements IdentifiableModel {
  @override
  final int id;

  @override
  final String name;

  UserModel({required this.id, required this.name});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'name': String name
      } => UserModel(id: id, name: name),
      _ => throw const FormatException('Failed to load user model.')
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