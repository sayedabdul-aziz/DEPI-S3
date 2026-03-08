import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:bookia/core/widgets/custom_text_form_field.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/core/widgets/my_body_view.dart';
import 'package:bookia/core/widgets/password_text_form_field.dart';
import 'package:bookia/features/auth/presentation/login_register/widgets/social_login.dart';
import 'package:bookia/features/auth/presentation/widgets/auth_footer.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () => pop(context),
              child: CustomSvgPicture(path: AppImages.backSvg),
            ),
          ],
        ),
      ),
      body: MyBodyView(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Welcome back! Glad to see you, Again!',
                style: TextStyles.headline,
              ),
              Gap(32),
              CustomTextFormField(hintText: 'Enter your email'),
              Gap(12),
              PasswordTextFormField(hintText: 'Enter your password'),
              Gap(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot password?',
                      style: TextStyles.caption1.copyWith(
                        color: AppColors.darkGreyColor,
                      ),
                    ),
                  ),
                ],
              ),
              Gap(30),
              MainButton(text: 'Login', onPressed: () {}),
              Gap(30),
              SocialLogin(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AuthFooter(
        text: "Don't have an account?",
        buttonText: 'Sign Up',
        onTap: () {
          pushReplacement(context, Routes.register);
        },
      ),
    );
  }
}
