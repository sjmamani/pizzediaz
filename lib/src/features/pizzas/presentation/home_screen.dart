import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pizzediaz/src/constants/app_colors.dart';
import 'package:pizzediaz/src/constants/app_text_styles.dart';
import 'package:pizzediaz/src/constants/box_shadows.dart';
import 'package:pizzediaz/src/features/pizzas/presentation/components/header_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HomeHeader(),
            SizedBox(height: 14),
            _HomePizzaList(title: 'Populares'),
            _HomePizzaList(title: 'Especiales'),
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              label: '',
              icon: const Icon(Icons.favorite),
              activeIcon: Column(
                children: const [Icon(Icons.favorite), _NavbarDot()],
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: const Icon(Icons.home),
              activeIcon: Column(
                children: const [Icon(Icons.home, size: 36), _NavbarDot()],
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: const Icon(Icons.shopping_cart),
              activeIcon: Column(
                children: const [Icon(Icons.shopping_cart), _NavbarDot()],
              ),
            ),
          ],
          currentIndex: 1,
          enableFeedback: true,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.primaryColor.withOpacity(0.3),
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
    );
  }
}

class _HomePizzaList extends StatelessWidget {
  const _HomePizzaList({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.h2),
          const SizedBox(height: 8),
          const PizzaCard(
            name: 'Muzzarella',
            description:
                'Masa casera con queso\nmuzzarella, salsa de tomate,\norégano y aceitunas frescas.',
            price: 400,
          ),
          const PizzaCard(
            name: 'Fugazzeta',
            description:
                'Masa casera con queso\nmuzzarella, salsa de tomate,\ncebolla, orégano y aceitunas\nfrescas.',
            price: 400,
          ),
          const PizzaCard(
            name: 'Calabresa',
            description:
                'Masa casera con queso\nmuzzarella, salsa de tomate,\nsalame picado grueso, orégano y\naceitunas frescas.',
            price: 400,
          ),
        ],
      ),
    );
  }
}

class _NavbarDot extends StatelessWidget {
  const _NavbarDot({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 4,
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        shape: BoxShape.circle,
      ),
    );
  }
}

class PizzaCard extends StatelessWidget {
  const PizzaCard({
    Key? key,
    required this.name,
    required this.description,
    required this.price,
  }) : super(key: key);

  final String name;
  final String description;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [kBoxShadow],
        color: AppColors.primaryColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 2,
            child: SvgPicture.asset('assets/images/pizza.svg', height: 96),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppTextStyles.h5.copyWith(color: Colors.white),
                ),
                Text(
                  description,
                  style: AppTextStyles.caption.copyWith(color: Colors.white),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '\$$price',
                    style: AppTextStyles.h4.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
