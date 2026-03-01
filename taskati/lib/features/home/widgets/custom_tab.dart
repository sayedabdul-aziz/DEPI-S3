import 'package:flutter/material.dart';
import 'package:taskati/core/styles/app_colors.dart';
import 'package:taskati/core/styles/text_styles.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({super.key, required this.isSelected, required this.title});

  final bool isSelected;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 40,
      child: Container(
        width: double.infinity,
        height: 40,
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected
              ? AppColors.primaryColor
              : Theme.of(context).colorScheme.tertiaryContainer,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyles.caption1.copyWith(
              fontWeight: FontWeight.w600,
              color: isSelected
                  ? AppColors.backgroundColor
                  : AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
