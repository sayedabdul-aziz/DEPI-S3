import 'package:flutter/material.dart';
import 'package:greenmart/core/constants/app_assets.dart';
import 'package:greenmart/core/styles/app_colors.dart';
import 'package:greenmart/core/widgets/custom_svg_picture.dart';
import 'package:greenmart/features/home/page/home_screen.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    Center(child: Text('Explore')),
    Center(child: Text('Cart')),
    Center(child: Text('Favorites')),
    Center(child: Text('Profile')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -5),
              blurRadius: 10,
              spreadRadius: 3,
              color: Color(0xff555E58).withValues(alpha: 0.1),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: CustomSvgPicture(path: AppAssets.storeSvg),
              activeIcon: CustomSvgPicture(
                path: AppAssets.storeSvg,
                color: AppColors.primaryColor,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: CustomSvgPicture(path: AppAssets.exploreSvg),
              activeIcon: CustomSvgPicture(
                path: AppAssets.exploreSvg,
                color: AppColors.primaryColor,
              ),
              label: 'explore',
            ),
            BottomNavigationBarItem(
              icon: CustomSvgPicture(path: AppAssets.cartSvg),
              activeIcon: CustomSvgPicture(
                path: AppAssets.cartSvg,
                color: AppColors.primaryColor,
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: CustomSvgPicture(path: AppAssets.heartSvg),
              activeIcon: CustomSvgPicture(
                path: AppAssets.heartSvg,
                color: AppColors.primaryColor,
              ),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: CustomSvgPicture(path: AppAssets.userSvg),
              activeIcon: CustomSvgPicture(
                path: AppAssets.userSvg,
                color: AppColors.primaryColor,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
