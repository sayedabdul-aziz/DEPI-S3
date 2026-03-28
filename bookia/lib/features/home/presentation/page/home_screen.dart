import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:bookia/features/home/presentation/widgets/home_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
            icon: CustomSvgPicture(path: AppImages.searchSvg),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(children: [Gap(20), HomeSlider()]),
    );
  }
}
