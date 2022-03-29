import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pizzediaz/src/common_widgets/main_button_widget.dart';
import 'package:pizzediaz/src/constants/app_colors.dart';
import 'package:pizzediaz/src/constants/app_text_styles.dart';
import 'package:pizzediaz/src/features/login/presentation/login_screen.dart';

final onboardingProvider =
    StateNotifierProvider<OnboardingIndex, int>((ref) => OnboardingIndex());

class OnboardingIndex extends StateNotifier<int> {
  OnboardingIndex() : super(0);

  void updateIndex(int index) => state = index;
}

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(onboardingProvider);
    final pageController = PageController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (value) =>
                    ref.read(onboardingProvider.notifier).updateIndex(value),
                children: [
                  _OnboardingPage(
                    title: 'Pedí una pizza',
                    textContent:
                        'Elegí qué pizza vas a cenar esta noche y aboná de la manera que quieras',
                    selectedIndex: selectedIndex,
                    assetName: 'assets/images/onboarding_1.png',
                  ),
                  _OnboardingPage(
                    title: 'Esperá tu delivery',
                    textContent:
                        'Nuestros deliverys te lo alcanzarán sin costo de envío a tu domicilio',
                    selectedIndex: selectedIndex,
                    assetName: 'assets/images/onboarding_2.png',
                  ),
                  _OnboardingPage(
                    title: 'Disfrutá la comida',
                    textContent: 'Disfrutá de nuestras pizzas en familia',
                    selectedIndex: selectedIndex,
                    assetName: 'assets/images/onboarding_3.png',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 10),
              child: Column(
                children: [
                  MainButton(
                    text: 'Siguiente',
                    onPressed: () {
                      if (selectedIndex < 2) {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.ease,
                        );
                        ref
                            .read(onboardingProvider.notifier)
                            .updateIndex(selectedIndex + 1);
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const LoginScreen(),
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 8),
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                            color: index == selectedIndex
                                ? AppColors.primaryColor
                                : AppColors.primaryColor.withOpacity(0.25),
                            shape: BoxShape.circle,
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingPage extends StatelessWidget {
  const _OnboardingPage({
    Key? key,
    required this.title,
    required this.textContent,
    required this.selectedIndex,
    required this.assetName,
  }) : super(key: key);

  final String title;
  final String textContent;
  final int selectedIndex;
  final String assetName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 60, 16, 0),
          child: Text(title, style: AppTextStyles.h1),
        ),
        Expanded(child: Image.asset(assetName)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: Text(
            textContent,
            style: AppTextStyles.paragraph,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
