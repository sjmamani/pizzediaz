import 'package:flutter/material.dart';
import 'package:pizzediaz/src/constants/app_colors.dart';
import 'package:pizzediaz/src/constants/app_text_styles.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(
        height: 40,
        width: double.infinity,
      ),
      child: ElevatedButton(
        child: Text(text, style: AppTextStyles.button),
        style: ElevatedButton.styleFrom(
          elevation: 4,
          primary: AppColors.primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
