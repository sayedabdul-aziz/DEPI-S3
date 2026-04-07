import 'package:bookia/core/widgets/shimmer/custom_shimmer_widget.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/cubit/home_state.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var sliders = context.read<HomeCubit>().sliders;
        if (state is! HomeSuccessState) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomShimmerWidget(
              width: double.infinity,
              height: 170,
              borderRadius: 10,
            ),
          );
        }
        return Column(
          children: [
            CarouselSlider.builder(
              itemCount: sliders.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          sliders[itemIndex].image ?? "",
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
              count: sliders.length,
              effect: ScrollingDotsEffect(
                dotHeight: 9,
                dotWidth: 9,
                activeDotColor: AppColors.primaryColor,
              ),
            ),
          ],
        );
      },
    );
  }
}
