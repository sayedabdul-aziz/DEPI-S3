import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:bookia/core/widgets/custom_text_form_field.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/core/widgets/my_body_view.dart';
import 'package:bookia/core/widgets/password_text_form_field.dart';
import 'package:bookia/features/auth/presentation/widgets/auth_footer.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                'Hello! Register to get started',
                style: TextStyles.headline,
              ),
              Gap(32),
              CustomTextFormField(hintText: 'Full Name'),
              Gap(12),
              CustomTextFormField(hintText: 'Email'),
              Gap(12),
              PasswordTextFormField(hintText: 'Password'),
              Gap(12),
              PasswordTextFormField(hintText: 'Confirm Password'),

              Gap(30),
              MainButton(text: 'Register', onPressed: () {}),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AuthFooter(
        text: "Already have an account?",
        buttonText: 'Sign In',
        onTap: () {
          pushReplacement(context, Routes.login);
        },
      ),
    );
  }
}
