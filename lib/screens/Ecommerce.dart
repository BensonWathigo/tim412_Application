import 'package:flutter/material.dart';

class EcommerceScreen extends StatelessWidget {
  const EcommerceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Center(
            child: Text(
          'Shopping',
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
