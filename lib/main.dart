import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:misis/models/Domain/filial.dart';
import 'package:misis/models/Domain/group.dart';
import 'package:misis/models/Domain/room.dart';
import 'package:misis/models/Domain/teacher.dart';
import 'package:misis/profile_manager/profile_manager.dart';
import 'package:misis/profile_manager/profile_manager_imp.dart';
import 'package:misis/provider/provider.dart';
import 'package:misis/router/app_router.dart';
import 'package:misis/screens/list_screen.dart';
import 'package:misis/widgets/misis_progress_indicator/misis_progress_indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Вынести ProfileManager, AppRouter и Provider в Dependecies
  final AppRouter router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router.rootRouter,
    );
  }
}