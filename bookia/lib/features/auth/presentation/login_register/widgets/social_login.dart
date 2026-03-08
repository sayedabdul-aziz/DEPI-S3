import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider()),
            Gap(40),
            Text(
              'OR',
              style: TextStyles.caption1.copyWith(
                color: AppColors.darkGreyColor,
              ),
            ),
            Gap(40),
            Expanded(child: Divider()),
          ],
        ),
        Gap(30),
        SocialButton(
          path: AppImages.googleSvg,
          text: 'Continue with Google',
          onTap: () {},
        ),
        Gap(10),
        SocialButton(
          path: AppImages.appleSvg,
          text: 'Continue with Apple',
          onTap: () {},
        ),
      ],
    );
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.path,
    required this.text,
    required this.onTap,
  });
  final String path;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSvgPicture(path: path),
            Gap(10),
            Text(
              text,
              style: TextStyles.caption1.copyWith(
                color: AppColors.darkGreyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
