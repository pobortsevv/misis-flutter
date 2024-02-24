import 'dart:convert';
import 'package:misis/models/filial.dart';
import 'package:http/http.dart' as http;
import 'package:misis/provider/app_url.dart';

abstract class AppProvider {
  Future<List<Filial>> fetchFilials();
}

final class AppProviderImp implements AppProvider {
  @override
  Future<List<Filial>> fetchFilials() async {
    Map data = {
      'get_filials': {}
    };
    //encode Map to JSON
    var body = json.encode(data);

    final response = await http
      .put(
        Uri.parse(AppUrl.requestURL),
        headers: { 
          "Accept": "application/json",
          "Content-type": "application/json",
        },
        body: body
      );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final getFilials = GetFilials.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      return getFilials.asDomainModel();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load filials');
    }
  }
}