final class GetFilials {
  final Map<String, dynamic> getFilials;

  const GetFilials({
    required this.getFilials
  });

  // Получим объект вида:
  /*
    "119": { "id": 119, "name": "СТИ НИТУ «МИСиС»", "genitive_name": "СТИ НИТУ «МИСиС»", "code": "oskol" },
    "365": { "id": 365, "name": "Новотроицкий филиал", "genitive_name": "Новотроицкого филиала", "code": "novotroick" },
    "607": { "id": 607, "name": "Выксунский филиал НИТУ \"МИСиС\"", "genitive_name": "Выксунского филиала", "code": "vyksa" },
    "order": [880, 119, 365, 607] // Надо понять, как это декодить
  */
  factory GetFilials.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'get_filials': Map<String, dynamic> getFilials
      } => GetFilials(getFilials: getFilials),
      _ => throw const FormatException('Failed to load filials.')
    };
  }

  List<Filial> asDomainModel() {
    final order = getFilials['order'];
    // final Map<String, dynamic> filialsWithoutOrder = getFilials.remove('order');

    List<Filial> filials = [];
    for (var value in getFilials.values) {
      if (value is Map<String, dynamic>) {
        filials.add(Filial.fromJson(value));
      }
    }

    List<Filial> orderedFilials = [];

    for (var id in order) {
      final foundFilial = filials.firstWhere((element) => element.id == id);
      orderedFilials.add(foundFilial);
    }

    return orderedFilials;
  }
}

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
}