import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/extenstion.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:bookia/features/home/presentation/widgets/best_seller_builder.dart';
import 'package:bookia/features/home/presentation/widgets/home_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: CustomSvgPicture(path: AppImages.logoSvg, height: 30),
        actions: [
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () {
              context.setLocale(context.isArabic ? Locale('en') : Locale('ar'));
            },
          ),
          IconButton(
            icon: CustomSvgPicture(path: AppImages.searchSvg),
            onPressed: () {
              pushTo(context, Routes.search);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [20.h, HomeSlider(), BestSellerBuilder()]),
      ),
    );
  }
}
