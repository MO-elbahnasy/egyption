import 'package:egyptifi/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EgyptifyApp());
}

class EgyptifyApp extends StatelessWidget {
  const EgyptifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Egyptify',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const OnboardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}