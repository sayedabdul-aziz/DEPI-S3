import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: 5,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      AppImages.bg,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
          options: CarouselOptions(
            height: 170,
            // aspectRatio: 16 / 9,
            viewportFraction: 0.9,
            autoPlay: true,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (int index, CarouselPageChangedReason reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
        const Gap(10),
        AnimatedSmoothIndicator(
          activeIndex: currentIndex,
          count: 6,
          effect: ScrollingDotsEffect(
            dotHeight: 9,
            dotWidth: 9,
            activeDotColor: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
