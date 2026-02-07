import 'package:flutter/material.dart';
import 'package:greenmart/core/constants/app_assets.dart';
import 'package:greenmart/core/functions/navigations.dart';
import 'package:greenmart/core/styles/app_colors.dart';
import 'package:greenmart/core/styles/text_styles.dart';
import 'package:greenmart/core/widgets/custom_password_field.dart';
import 'package:greenmart/core/widgets/custom_svg_picture.dart';
import 'package:greenmart/core/widgets/custom_text_field.dart';
import 'package:greenmart/core/widgets/main_button.dart';
import 'package:greenmart/features/auth/page/register_screen.dart';

// to handle input validation :
// 1 - Wrap the Column with "Form" Widget
// 2 - create formKey<GlobalState> and assign it to the Form
// 3 - add validator to each TextFormField
// 4 - check formKey.currentState?.validate() when login btn is pressed

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: CustomSvgPicture(path: AppAssets.carrotSvg),
                  ),
                  SizedBox(height: 40),
                  Text('Login', style: TextStyles.title),
                  SizedBox(height: 16),
                  Text(
                    'Enter your emails and password',
                    style: TextStyles.body.copyWith(color: AppColors.greyColor),
                  ),
                  SizedBox(height: 40),
                  Text(
                    'Email',
                    style: TextStyles.caption1.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.greyColor,
                    ),
                  ),
                  SizedBox(height: 8),
                  CustomTextField(
                    hint: 'example@gmail.com',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      } else if (!value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Password',
                    style: TextStyles.caption1.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.greyColor,
                    ),
                  ),
                  SizedBox(height: 8),
                  CustomPasswordField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () {},
                      child: Text(
                        'Forget Password?',
                        style: TextStyles.caption1,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  MainButton(
                    text: 'Login',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        //  handle login logic
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyles.caption1.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () {
                          pushReplacement(context, RegisterScreen());
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyles.caption1.copyWith(
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
      ),
    );
  }
}
