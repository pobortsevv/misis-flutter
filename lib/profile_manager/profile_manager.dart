import 'package:misis/models/profile.dart';

abstract class ProfileManager {
  Future<void> addProfile(Profile profile);
  Future<void> removeProfile();
  Future<Profile?> getProfile();

  Future<bool> isLoggedIn();
}