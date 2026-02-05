import 'package:flutter/material.dart';
import 'package:greenmart/core/constants/app_assets.dart';
import 'package:greenmart/core/functions/navigations.dart';
import 'package:greenmart/core/styles/app_colors.dart';
import 'package:greenmart/core/styles/text_styles.dart';
import 'package:greenmart/core/widgets/custom_password_field.dart';
import 'package:greenmart/core/widgets/custom_svg_picture.dart';
import 'package:greenmart/core/widgets/custom_text_field.dart';
import 'package:greenmart/core/widgets/main_button.dart';
import 'package:greenmart/features/auth/page/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: CustomSvgPicture(path: AppAssets.carrotSvg),
                ),
                SizedBox(height: 40),
                Text('Sign Up', style: TextStyles.title),
                SizedBox(height: 16),
                Text(
                  'Enter your credentials to continue',
                  style: TextStyles.body.copyWith(color: AppColors.greyColor),
                ),
                SizedBox(height: 40),
                Text(
                  'Name',
                  style: TextStyles.button.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.greyColor,
                  ),
                ),
                SizedBox(height: 8),
                CustomTextField(hint: 'ex: John Doe'),
                SizedBox(height: 16),
                Text(
                  'Email',
                  style: TextStyles.button.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.greyColor,
                  ),
                ),
                SizedBox(height: 8),
                CustomTextField(
                  hint: 'example@gmail.com',
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 16),
                Text(
                  'Password',
                  style: TextStyles.button.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.greyColor,
                  ),
                ),
                SizedBox(height: 8),
                CustomPasswordField(),

                SizedBox(height: 30),
                MainButton(text: 'Sign Up', onPressed: () {}),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyles.button.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () {
                        pushReplacement(context, LoginScreen());
                      },
                      child: Text(
                        'Login',
                        style: TextStyles.button.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
