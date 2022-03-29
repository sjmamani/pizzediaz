import 'package:flutter/material.dart';
import 'package:pizzediaz/src/constants/app_colors.dart';

abstract class AppTextStyles {
  static const String primaryFontFamily = 'Fira Sans';
  static const String secondaryFontFamily = 'Noto Sans';

  static const TextStyle h1 = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 34,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle h2 = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.5,
  );

  static const TextStyle h4 = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.16,
  );

  static const TextStyle h5 = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.16,
    height: 1.5,
  );

  static const TextStyle paragraph = TextStyle(
    fontFamily: secondaryFontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.16,
  );

  static const TextStyle input = TextStyle(
    fontFamily: secondaryFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  );

  static const TextStyle label = TextStyle(
    fontFamily: primaryFontFamily,
    color: AppColors.primaryColor,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.4,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.16,
  );

  static const TextStyle button = TextStyle(
    fontFamily: secondaryFontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 1.2,
    color: AppColors.whiteColor,
  );
}
