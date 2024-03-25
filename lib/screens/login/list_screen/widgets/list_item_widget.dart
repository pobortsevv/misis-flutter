import 'package:flutter/cupertino.dart';
    
class ListItemWidget extends StatelessWidget {
  final Function onTap;
  final String title;

  const ListItemWidget({required this.title, required this.onTap, super.key});
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async { onTap(); },
      child: CupertinoListTile(title: Text(title))
    );
  }
}