import 'package:flutter/material.dart';
import 'package:pizzediaz/src/constants/app_colors.dart';
import 'package:pizzediaz/src/constants/app_text_styles.dart';
import 'package:pizzediaz/src/features/onboarding/presentation/onboarding_screen.dart';

class PizzediazApp extends StatelessWidget {
  const PizzediazApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizzediaz',
      home: const OnboardingScreen(),
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: AppColors.primaryColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: AppColors.primaryColor),
          ),
          focusColor: AppColors.primaryColor,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: AppTextStyles.label.copyWith(fontSize: 16),
        ),
      ),
    );
  }
}
