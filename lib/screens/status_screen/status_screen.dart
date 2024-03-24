import 'package:flutter/cupertino.dart';
import 'package:misis/screens/status_screen/status_view_model.dart';

class StatusScreen extends StatelessWidget {
  final StatusViewModel vm;

  const StatusScreen({required this.vm, super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        border: Border(bottom: BorderSide(color: CupertinoTheme.of(context).barBackgroundColor))
      ),
      child: Column(
        children: [
          CupertinoButton(
            onPressed: () => vm.onStudentTap(context),
            child: const Text("Студент"),
          ),
          CupertinoButton(
            onPressed: () => vm.onTeacherTap(context),
            child: const Text("Преподаватель"),
          )
        ],
      )
    );
  }
}