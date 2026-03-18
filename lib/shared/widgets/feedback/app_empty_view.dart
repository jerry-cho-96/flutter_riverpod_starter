import 'package:flutter/material.dart';

class AppEmptyView extends StatelessWidget {
  const AppEmptyView({required this.message, super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(message));
  }
}
