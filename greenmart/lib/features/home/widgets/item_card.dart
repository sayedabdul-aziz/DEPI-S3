import 'package:flutter/material.dart';
import 'package:greenmart/core/constants/app_assets.dart';
import 'package:greenmart/core/styles/app_colors.dart';
import 'package:greenmart/core/styles/text_styles.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.accentColor),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            blurRadius: 10,
            spreadRadius: 1,
            color: AppColors.greyColor.withValues(alpha: 0.1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image.asset(AppAssets.apple)),
          SizedBox(height: 16),
          Text(
            'Apple Juice',
            style: TextStyles.body.copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 6),
          Text(
            '1kg',
            style: TextStyles.small.copyWith(color: AppColors.greyColor),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Text(
                '\$1.000',
                style: TextStyles.body.copyWith(fontWeight: FontWeight.w600),
              ),
              Spacer(),
              SizedBox(
                height: 38,
                width: 38,
                child: FloatingActionButton.small(
                  elevation: 0,
                  backgroundColor: AppColors.primaryColor,
                  onPressed: () {},
                  child: Icon(Icons.add, color: AppColors.backgroundColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
