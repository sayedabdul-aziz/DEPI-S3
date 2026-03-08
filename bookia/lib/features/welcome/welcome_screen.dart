import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.bg,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 0,
            left: 22,
            right: 22,
            bottom: 0,
            child: Column(
              children: [
                Spacer(flex: 2),
                CustomSvgPicture(path: AppImages.logoSvg, width: 250),
                Gap(15),
                Text('Order Your Book Now!', style: TextStyles.subtitle1),
                Spacer(flex: 5),
                MainButton(
                  text: 'Login',
                  onPressed: () {
                    pushTo(context, Routes.login);
                  },
                ),
                Gap(15),
                MainButton(
                  borderColor: AppColors.darkColor,
                  bgColor: AppColors.backgroundColor,
                  textColor: AppColors.darkColor,
                  text: 'Register',
                  onPressed: () {
                    pushTo(context, Routes.register);
                  },
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
