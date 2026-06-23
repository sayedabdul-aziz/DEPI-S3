import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:bookia/features/profile/presentation/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userInfo = SharedPref.getUserInfo();
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const CustomSvgPicture(path: AppImages.logoutSvg),
          ),
          const Gap(10),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Gap(20),
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: AppColors.greyColor,
                  backgroundImage: NetworkImage(userInfo?.image ?? ''),
                ),
                const Gap(15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userInfo?.name ?? 'N/A',
                        style: TextStyles.subtitle1.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Gap(5),
                      Text(
                        userInfo?.email ?? 'N/A',
                        style: TextStyles.caption1.copyWith(
                          color: AppColors.greyColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Gap(30),
            ProfileMenuItem(title: 'My Orders', onTap: () {}),
            ProfileMenuItem(
              title: 'Edit Profile',
              onTap: () {
                pushTo(context, Routes.editProfile);
              },
            ),
            ProfileMenuItem(title: 'Reset Password', onTap: () {}),
            ProfileMenuItem(title: 'FAQ', onTap: () {}),
            ProfileMenuItem(title: 'Contact Us', onTap: () {}),
            ProfileMenuItem(title: 'Privacy & Terms', onTap: () {}),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
