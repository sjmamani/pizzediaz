import 'package:flutter/material.dart';
import 'package:pizzediaz/src/app/constants/app_colors.dart';
import 'package:pizzediaz/src/app/constants/app_text_styles.dart';
import 'package:pizzediaz/src/presentation/widgets/main_button_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: LayoutBuilder(builder: (context, viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(minHeight: viewportConstraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    ClipPath(
                      clipper: SignupClipPath(),
                      child: Stack(
                        children: [
                          Container(
                            color: AppColors.primaryColor,
                            // height: MediaQuery.of(context).size.height * 0.15,
                            height: 131,
                          ),
                          Positioned(
                            left: 16,
                            top: 14,
                            child: ConstrainedBox(
                              constraints: const BoxConstraints.tightFor(
                                width: 34,
                                height: 30,
                              ),
                              child: ElevatedButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Icon(
                                  Icons.arrow_back,
                                  color: AppColors.primaryColor,
                                ),
                                style: ElevatedButton.styleFrom(
                                  elevation: 4,
                                  padding: EdgeInsets.zero,
                                  primary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            top: 43,
                            child: Text(
                              'Crear cuenta',
                              style: AppTextStyles.h2
                                  .copyWith(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Form(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Spacer(),
                              TextFormField(
                                cursorColor: AppColors.primaryColor,
                                keyboardType: TextInputType.name,
                                style: AppTextStyles.input,
                                textInputAction: TextInputAction.next,
                                decoration: const InputDecoration(
                                  labelText: 'Nombre y Apellido',
                                ),
                              ),
                              const SizedBox(height: 24),
                              TextFormField(
                                cursorColor: AppColors.primaryColor,
                                keyboardType: TextInputType.emailAddress,
                                style: AppTextStyles.input,
                                textInputAction: TextInputAction.next,
                                decoration: const InputDecoration(
                                  labelText: 'Correo electrónico',
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
                              const SizedBox(height: 24),
                              TextFormField(
                                obscureText: true,
                                cursorColor: AppColors.primaryColor,
                                keyboardType: TextInputType.emailAddress,
                                style: AppTextStyles.input,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  labelText: 'Confirmar contraseña',
                                  suffixIcon: IconButton(
                                    color: AppColors.primaryColor,
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    icon: const Icon(Icons.visibility_off),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                              const Spacer(),
                              MainButton(text: 'Registrarse', onPressed: () {}),
                              const SizedBox(height: 32),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class SignupClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double h = size.height;
    double w = size.width;

    final path = Path();

    path.lineTo(0, h - 43);
    path.quadraticBezierTo(w * 0.5, h + 43, w, h - 43);
    path.lineTo(w, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
