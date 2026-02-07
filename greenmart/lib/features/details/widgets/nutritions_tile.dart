import 'package:flutter/material.dart';
import 'package:greenmart/core/styles/app_colors.dart';
import 'package:greenmart/core/styles/text_styles.dart';

class NutritionsTile extends StatelessWidget {
  const NutritionsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Nutritions',
          style: TextStyles.caption1.copyWith(fontWeight: FontWeight.w600),
        ),
        Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.accentColor,
          ),
          child: Center(
            child: Text('29 cal', style: TextStyles.caption2.copyWith()),
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColors.greyColor,
            size: 18,
          ),
        ),
      ],
    );
  }
}
