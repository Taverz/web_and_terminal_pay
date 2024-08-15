import 'package:flutter/material.dart';

class TitlePage extends StatelessWidget {
  final String title;
  const TitlePage({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
