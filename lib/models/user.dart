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
  final String value;

  const User(this.status, this.value);

  factory User.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'status': String status,
        'value': String value
      } => User(Status.values.byName(status), value),
      _ => throw const FormatException('Failed to load user.')
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status.name,
      'value': value
    };
  }
}