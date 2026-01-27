import 'package:flutter/material.dart';
import 'package:greenmart/core/constants/app_assets.dart';
import 'package:greenmart/core/styles/app_colors.dart';
import 'package:greenmart/core/styles/text_styles.dart';
import 'package:greenmart/core/widgets/custom_password_field.dart';
import 'package:greenmart/core/widgets/custom_svg_picture.dart';
import 'package:greenmart/core/widgets/custom_text_field.dart';
import 'package:greenmart/core/widgets/main_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: CustomSvgPicture(path: AppAssets.carrotSvg),
              ),
              SizedBox(height: 70),
              Text('Login', style: TextStyles.title),
              SizedBox(height: 16),
              Text(
                'Enter your emails and password',
                style: TextStyles.body.copyWith(color: AppColors.greyColor),
              ),
              SizedBox(height: 40),
              Text('Email', style: TextStyles.body),
              SizedBox(height: 8),
              CustomTextField(hint: 'example@gmail.com'),
              SizedBox(height: 16),
              Text('Password', style: TextStyles.body),
              SizedBox(height: 8),
              CustomPasswordField(),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () {},
                  child: Text('Forget Password?', style: TextStyles.button),
                ),
              ),
              SizedBox(height: 16),
              MainButton(text: 'Login', onPressed: () {}),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyles.body.copyWith(color: AppColors.greyColor),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    onPressed: () {},
                    child: Text(
                      'Sign Up',
                      style: TextStyles.body.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
