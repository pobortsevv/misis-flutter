import 'package:flutter/cupertino.dart';
import 'package:misis/figma/styles.dart';
import 'package:misis/screens/login/status_screen/status_view_model.dart';

import 'widgets/status_button.dart';

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Text(
              vm.title,
              textAlign: TextAlign.left,
              style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
            ),
          ),
          StatusButton(
            title: 'Студент',
            color: FigmaColors.primary.withOpacity(0.3),
            image: const AssetImage('assets/images/hat.png'),
            onTap: () => vm.onStudentTap(context)
          ),
          StatusButton(
            title: 'Преподаватель',
            color: FigmaColors.secondary.withOpacity(0.3),
            image: const AssetImage('assets/images/suitcase.png'),
            onTap: () => vm.onTeacherTap(context)
          )
        ],
      )
    );
  }
}