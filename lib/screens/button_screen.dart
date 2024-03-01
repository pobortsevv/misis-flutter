import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key, required this.title, required this.nextScreen});
  final String title;
  final String nextScreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: TextButton(
          onPressed: () => context.pushNamed(nextScreen),
          child: const Text("click"),
        ),
      )
    );
  }
}
