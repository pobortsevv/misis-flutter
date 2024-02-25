import 'package:misis/models/Domain/filial.dart';
import 'package:misis/models/user.dart';

final class Profile {
  final Filial filial;
  final User user;

  Profile({required this.filial, required this.user});

  static Profile? fromJson(Map<String, dynamic> json) {
    try {
      final filialJson = json['filial'];
      final filial = Filial.fromJson(filialJson);

      final userJson = json['user'];
      final user = User.fromJson(userJson); 

    return Profile(filial: filial, user: user);
    } catch(e) {
      return null;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'filial': filial.toJson(),
      'user': user.toJson()
    };
  }
}