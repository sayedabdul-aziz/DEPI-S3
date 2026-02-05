import 'package:flutter/material.dart';
import 'package:greenmart/core/constants/app_assets.dart';
import 'package:greenmart/core/styles/app_colors.dart';
import 'package:greenmart/core/widgets/custom_svg_picture.dart';
import 'package:greenmart/features/home/widgets/best_selling_builder.dart';
import 'package:greenmart/features/home/widgets/exclusive_offer_builder.dart';
import 'package:greenmart/features/home/widgets/home_search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomSvgPicture(
          path: AppAssets.logoSvg,
          height: 42,
          color: AppColors.primaryColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            HomeSearchBar(),
            ExclusiveOfferBuilder(),
            BestSellingBuilder(),
          ],
        ),
      ),
    );
  }
}
