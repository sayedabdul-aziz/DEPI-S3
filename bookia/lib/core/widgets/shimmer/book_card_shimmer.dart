import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/widgets/shimmer/custom_shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookCardShimmer extends StatelessWidget {
  const BookCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: CustomShimmerWidget(
              width: double.infinity,
              height: double.infinity,
              borderRadius: 10,
            ),
          ),
          const Gap(10),
          const CustomShimmerWidget(width: 100, height: 15),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              CustomShimmerWidget(width: 50, height: 15),
              CustomShimmerWidget(width: 70, height: 30, borderRadius: 8),
            ],
          ),
        ],
      ),
    );
  }
}
