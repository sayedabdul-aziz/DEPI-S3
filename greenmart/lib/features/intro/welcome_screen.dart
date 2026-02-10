import 'package:flutter/material.dart';
import 'package:greenmart/core/constants/app_assets.dart';
import 'package:greenmart/core/functions/navigations.dart';
import 'package:greenmart/core/styles/text_styles.dart';
import 'package:greenmart/core/widgets/custom_svg_picture.dart';
import 'package:greenmart/core/widgets/main_button.dart';
import 'package:greenmart/features/main/main_app_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // image
          Image.asset(
            AppAssets.welcome,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
      
          // content
          Positioned(
            bottom: 60,
            left: 30,
            right: 30,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomSvgPicture(
                  path: AppAssets.carrotSvg,
                  color: Colors.white,
                ),
                SizedBox(height: 32),
                Text(
                  'Welcome\nto our store',
                  textAlign: TextAlign.center,
                  style: TextStyles.headline.copyWith(color: Colors.white),
                ),
                SizedBox(height: 16),
                Text(
                  'Ger your groceries in as fast as one hour',
                  textAlign: TextAlign.center,
                  style: TextStyles.body.copyWith(color: Colors.white),
                ),
                SizedBox(height: 40),
                MainButton(
                  text: 'Get Started',
                  onPressed: () {
                    pushReplacement(context, MainAppScreen());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
