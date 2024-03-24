import 'package:flutter/cupertino.dart';
import 'package:misis/figma/styles.dart';
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
            color: FigmaColors.primary,
            onTap: () => vm.onStudentTap(context)
          ),
          const SizedBox(
            height: 16,
          ),
          StatusButton(
            title: 'Преподаватель',
            color: FigmaColors.secondary,
            onTap: () => vm.onTeacherTap(context)
          )
        ],
      )
    );
  }
}

class StatusButton extends StatelessWidget {
  final String title;
  final Color color;
  final Function onTap;

  const StatusButton({
    required this.title,
    required this.color,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async { onTap(); },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 29.5, vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(color: color, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(12))
        ),
        child: Column(
          children: [
            // Image(image: ),
            Text(title, style: const FigmaTextStyles().title, textAlign: TextAlign.center)
          ]
        )
      )
    );
  }
}