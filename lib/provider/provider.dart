import 'dart:convert';
import 'package:misis/models/DTO/filial_dto.dart';
import 'package:misis/models/DTO/group_dto.dart';
import 'package:misis/models/Domain/filial.dart';
import 'package:http/http.dart' as http;
import 'package:misis/models/Domain/group.dart';
import 'package:misis/provider/app_url.dart';
import 'package:misis/provider/task.dart';

abstract class AppProvider {
  Future<List<Filial>> fetchFilials();
  Future<List<Group>> fetchGroups();
  Future<void> fetchRooms();
  Future<void> fetchTeachers();
}

final class AppProviderImp implements AppProvider {
  @override
  Future<List<Filial>> fetchFilials() async {
    final body = TaskType.filials.getEncodedBody();
    final response = await _makeResponse(body);

    if (response.statusCode == 200) {
      final getFilials = GetFilials.fromJson(jsonDecode(response.body) as Map<String, dynamic>);

      return getFilials.asDomainModel();
    } else {
      throw Exception('Failed to load filials');
    }
  }

  @override
  Future<List<Group>> fetchGroups() async {
    final body = TaskType.groups.getEncodedBody();
    final response = await _makeResponse(body);

    if (response.statusCode == 200) {
      final getGroups = GetGroups.fromJson(jsonDecode(response.body) as Map<String, dynamic>);

      return getGroups.asDomainModel();
    } else {
      throw Exception('Failed to load groups');
    }
  }
  
  @override
  Future<void> fetchRooms() {
    // TODO: implement fetchRooms
    throw UnimplementedError();
  }
  
  @override
  Future<void> fetchTeachers() {
    // TODO: implement fetchTeachers
    throw UnimplementedError();
  }

  // MARK: Private

  static Future<http.Response> _makeResponse(String body) {
    return http
      .put(
        Uri.parse(AppUrl.requestURL),
        headers: _additionalHeaders,
        body: body
      );
  }

  static final Map<String, String> _additionalHeaders = { 
    "Accept": "application/json",
    "Content-type": "application/json",
  };
}