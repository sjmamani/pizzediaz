import 'package:flutter/material.dart';
import 'package:pizzediaz/src/constants/app_colors.dart';

class SecondaryActionButton extends StatelessWidget {
  const SecondaryActionButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(width: 34, height: 30),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Icon(icon, color: AppColors.primaryColor),
        style: ElevatedButton.styleFrom(
          elevation: 4,
          padding: EdgeInsets.zero,
          primary: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
