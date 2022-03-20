import 'package:flutter/material.dart';
import 'package:pizzediaz/src/presentation/screens/onboarding/onboarding_screen.dart';

class PizzediazApp extends StatelessWidget {
  const PizzediazApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Pizzediaz',
      home: OnboardingScreen(),
    );
  }
}
