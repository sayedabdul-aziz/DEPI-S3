import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

void showErrorDialog(BuildContext context, String errorMsg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(10),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: AppColors.errorColor,
      content: Row(
        children: [
          const Icon(Icons.error, color: AppColors.backgroundColor, size: 20),
          const Gap(10),
          Text(errorMsg),
        ],
      ),
    ),
  );
}

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: AppColors.darkColor.withValues(alpha: 0.7),
    builder: (context) => Center(child: Lottie.asset(AppImages.loadingJson)),
  );
}
