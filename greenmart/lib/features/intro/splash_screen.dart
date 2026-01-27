import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greenmart/core/constants/app_assets.dart';
import 'package:greenmart/core/functions/navigations.dart';
import 'package:greenmart/core/styles/app_colors.dart';
import 'package:greenmart/features/intro/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // delay with 3 seconds and navigate to welcome screen
    Future.delayed(Duration(seconds: 3), () {
      pushReplacement(context, const WelcomeScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(child: SvgPicture.asset(AppAssets.logoSvg, width: 250)),
    );
  }
}
