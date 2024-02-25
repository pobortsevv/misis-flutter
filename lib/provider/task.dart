import 'dart:convert';

enum TaskType {
  filials('get_filials'),
  groups('get_groups'),
  rooms('get_rooms'),
  teachers('get_teachers');

  const TaskType(this.bodyParam);
  final String bodyParam;

  String getEncodedBody() {
    return json.encode({ bodyParam: {} });
  }

  String getEncodedBodyByFilial(int filialId) {
    return json.encode({ bodyParam: { "filial": filialId } });
  }
}