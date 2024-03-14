import 'package:flutter/material.dart';
import 'package:misis/screens/status_screen/status_view_models.dart';

class StatusScreen extends StatelessWidget {
  final StatusViewModel vm;

  const StatusScreen({required this.vm, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(vm.title),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () => vm.onStudentTap(context),
            child: const Text("Студент"),
          ),
          TextButton(
            onPressed: () => vm.onTeacherTap(context),
            child: const Text("Преподаватель"),
          )
        ],
      )
    );
  }
}