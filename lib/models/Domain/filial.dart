/// Доменная модель филиала
final class Filial {
  final int id;
  final String name;
  final String shortname;
  final String code;

  const Filial({
    required this.id,
    required this.name,
    required this.shortname,
    required this.code
  });

  factory Filial.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'name': String name,
        'shortname': String shortname,
        'code': String code
      } => Filial(id: id, name: name, shortname: shortname, code: code),
      _ => throw const FormatException('Failed to load filial.')
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'shortname': shortname,
      'code': code
    };
  }
}