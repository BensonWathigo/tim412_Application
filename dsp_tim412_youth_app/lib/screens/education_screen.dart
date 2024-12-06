import 'package:flutter/material.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'CALENDAR OF EVENTS',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
