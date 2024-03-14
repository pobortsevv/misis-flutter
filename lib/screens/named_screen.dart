import 'package:flutter/material.dart';
import 'package:misis/models/profile.dart';

class EmptyScreen extends StatelessWidget {
  final String title;
  // final Profile profile;

  const EmptyScreen({required this.title, /*required this.profile, */super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          title: Text(title),
        ),
        body: Center(child:
          Column(
            children: [
              // ListTile(title: Text(profile.filial.toString())),
              // ListTile(title: Text(profile.user.toString()))
            ],
          )
        ),
    );
  }
}