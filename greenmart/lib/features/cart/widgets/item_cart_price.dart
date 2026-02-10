import 'package:flutter/material.dart';
import 'package:greenmart/core/styles/app_colors.dart';
import 'package:greenmart/core/styles/text_styles.dart';

class ItemCartPrice extends StatelessWidget {
  const ItemCartPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: AppColors.borderColor),
            ),
            child: Icon(Icons.remove, color: AppColors.greyColor),
          ),
        ),
        SizedBox(width: 6),
        SizedBox(
          width: 30,
          height: 30,
          child: Center(
            child: Text(
              '2',
              style: TextStyles.body.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        SizedBox(width: 6),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: AppColors.borderColor),
            ),
            child: Icon(Icons.add, color: AppColors.primaryColor),
          ),
        ),
        Spacer(),
        Text(
          '\$290',
          style: TextStyles.body.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
