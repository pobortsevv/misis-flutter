import 'dart:convert';
import 'package:misis/models/domain/profile.dart';
import 'package:misis/profile_manager/profile_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class ProfileManagerImp implements ProfileManager {
  static const _key = 'profile';
  
  @override
  Future<void> addProfile(Profile profile) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    
    await prefs.setString(_key, json.encode(profile.toJson()));
  }
  
  @override
  Future<void> removeProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove(_key);
  }

  @override
  Future<Profile?> getProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final rawProfile = prefs.getString(_key);

    if (rawProfile == null) { return null; }

    try {
      final profileData = json.decode(rawProfile) as Map<String, dynamic>;
      
      return Profile.fromJson(profileData);
    } catch(e) {
      return null;
    }
  }
  
  @override
  Future<bool> isLoggedIn() async {
    final profile = await getProfile();

    return profile != null ? true : false;
  }
}