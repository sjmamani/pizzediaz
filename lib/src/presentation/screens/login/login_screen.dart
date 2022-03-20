import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pizzediaz/src/app/constants/app_colors.dart';
import 'package:pizzediaz/src/app/constants/app_text_styles.dart';
import 'package:pizzediaz/src/presentation/widgets/main_button_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          ClipPath(
            clipper: LoginClipPath(),
            child: Container(
              color: AppColors.primaryColor,
              height: MediaQuery.of(context).size.height * 0.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 48, 16, 8),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    cursorColor: AppColors.primaryColor,
                    keyboardType: TextInputType.emailAddress,
                    style: AppTextStyles.input,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'Usuario o correo electrónico',
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    obscureText: true,
                    cursorColor: AppColors.primaryColor,
                    keyboardType: TextInputType.emailAddress,
                    style: AppTextStyles.input,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      suffixIcon: IconButton(
                        color: AppColors.primaryColor,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        icon: const Icon(Icons.visibility_off),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '¿Olvidaste la contraseña?',
                      style: AppTextStyles.label,
                    ),
                  ),
                  const SizedBox(height: 24),
                  MainButton(text: 'Iniciar sesión', onPressed: () {}),
                  const SizedBox(height: 8),
                  const Text(
                    'o iniciar sesión con',
                    style: AppTextStyles.caption,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/facebook_logo.svg'),
                      const SizedBox(width: 16),
                      SvgPicture.asset('assets/images/google_logo.svg'),
                    ],
                  ),
                  const SizedBox(height: 6),
                  RichText(
                    text: TextSpan(
                      text: '¿No tienes una cuenta? ',
                      style: AppTextStyles.caption.copyWith(
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: 'Registrate aquí',
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
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
