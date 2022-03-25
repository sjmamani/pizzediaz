import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pizzediaz/src/common_widgets/secondary_action_button.dart';
import 'package:pizzediaz/src/constants/app_colors.dart';
import 'package:pizzediaz/src/constants/app_text_styles.dart';
import 'package:pizzediaz/src/constants/box_shadows.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double logoDiameter = 136;
    double height = MediaQuery.of(context).size.height;
    double statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: LoginClipPath(),
              child: Stack(
                children: [
                  Container(
                    color: AppColors.primaryColor,
                    height: height * 0.3,
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: height * 0.19 - (logoDiameter / 2),
                    child: Container(
                      width: logoDiameter,
                      height: logoDiameter,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                        boxShadow: [kBoxShadow],
                      ),
                      child:
                          SvgPicture.asset('assets/images/pizzediaz_logo.svg'),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.fromLTRB(16, statusBarHeight + 16, 16, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SecondaryActionButton(
                            icon: Icons.menu, onPressed: () {}),
                        Text(
                          'Av. San José 1837',
                          style: AppTextStyles.paragraph.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        SecondaryActionButton(
                          icon: Icons.notifications_outlined,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double h = size.height;
    double w = size.width;

    final path = Path();

    path.lineTo(0, h - 65);
    path.quadraticBezierTo(w * 0.5, h + 65, w, h - 65);
    path.lineTo(w, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
