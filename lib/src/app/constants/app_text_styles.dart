import 'package:flutter/material.dart';
import 'package:pizzediaz/src/app/constants/app_colors.dart';

abstract class AppTextStyles {
  static const String primaryFontFamily = 'Fira Sans';
  static const String secondaryFontFamily = 'Noto Sans';

  static const TextStyle h1 = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 34,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle paragraph = TextStyle(
    fontFamily: secondaryFontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
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
