import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:misis/models/Domain/filial.dart';
import 'package:misis/models/Domain/group.dart';
import 'package:misis/models/Domain/room.dart';
import 'package:misis/models/Domain/teacher.dart';
import 'package:misis/models/profile.dart';
import 'package:misis/models/user.dart';
import 'package:misis/profile_manager/profile_manager.dart';
import 'package:misis/profile_manager/profile_manager_imp.dart';
import 'package:misis/provider/provider.dart';
import 'package:misis/router/app_router.dart';
import 'package:misis/screens/list_screen.dart';
import 'package:misis/widgets/misis_progress_indicator/misis_progress_indicator.dart';

void main() async {
  final ProfileManager profileManager = ProfileManagerImp();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // final filial = Filial(id: 880, name: "name", shortname: "shortname", code: "880");
  // final user = User(Status.teacher, "value");
  // profileManager.addProfile(Profile(filial: filial, user: user));
  // profileManager.removeProfile();
  // final profile = await profileManager.getProfile();

  runApp(MyApp(profileManager: profileManager));  
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  // Вынести ProfileManager, AppRouter и Provider в Dependecies
  late AppRouter router;
  ProfileManager profileManager;

  MyApp({required this.profileManager, super.key,}) {
    router = AppRouter(profileManager);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router.rootRouter,
    );
  }
}