import 'package:flutter/cupertino.dart';
    
class StatusButton extends StatelessWidget {
  final String title;
  final Color color;
  final AssetImage image;
  final Function onTap;

  const StatusButton({
    required this.title,
    required this.color,
    required this.image,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async { onTap(); },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 29.5, vertical: 16),
        margin: const EdgeInsets.symmetric(horizontal: 29.5, vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(color: color, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(12))
        ),
        child: Column(
          children: [
            Image(image: image),
            Text(title, style: CupertinoTheme.of(context).textTheme.navTitleTextStyle, textAlign: TextAlign.center)
          ]
        )
      )
    );
  }
}