import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    bool isLoggedIn = SharedPref.getToken().isNotEmpty;
    Future.delayed(const Duration(seconds: 3), () {
      if (isLoggedIn) {
        pushReplacement(context, Routes.main);
      } else {
        pushReplacement(context, Routes.welcome);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSvgPicture(path: AppImages.logoSvg, width: 250),
            Gap(10),
            Text('Order Your Book Now!', style: TextStyles.subtitle2),
          ],
        ),
      ),
    );
  }
}

// mobile => login => user, token data (Refresh Token)
// web => login => user, token data
// call profile api => get user data (Updated)
