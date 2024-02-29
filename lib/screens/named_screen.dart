import 'package:flutter/material.dart';
import 'package:misis/widgets/misis_progress_indicator/misis_progress_indicator.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key, required this.title});
  final String title;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          title: Text(title),
        ),
        body: const Center(child: MisisProgressIndicator()),
    );
  }
}