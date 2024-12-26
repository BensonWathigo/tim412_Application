import 'package:dsp_tim412_youth_app/Authentification/Login.dart';
import 'package:flutter/material.dart';

class Splashscreeen extends StatefulWidget {
  const Splashscreeen({super.key});

  @override
  State<Splashscreeen> createState() => _SplashscreeenState();
}

class _SplashscreeenState extends State<Splashscreeen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  void _navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DSP Tim412 YOUTH APP',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
        ),
      ),
      body: Center(
        child: Column(
          children: [Image.asset('lib/assets/images/gang.jpg')],
        ),
      ),
    );
  }
}
