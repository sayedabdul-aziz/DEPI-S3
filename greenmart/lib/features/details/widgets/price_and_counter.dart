import 'package:flutter/material.dart';
import 'package:greenmart/core/styles/app_colors.dart';
import 'package:greenmart/core/styles/text_styles.dart';

class PriceAndCounter extends StatelessWidget {
  const PriceAndCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Icon(Icons.remove, color: AppColors.greyColor),
        ),
        SizedBox(width: 12),
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColors.borderColor),
          ),
          child: Center(
            child: Text(
              '29',
              style: TextStyles.body.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SizedBox(width: 12),
        GestureDetector(
          onTap: () {},
          child: Icon(Icons.add, color: AppColors.primaryColor),
        ),
        Spacer(),
        Text('\$290', style: TextStyles.title),
      ],
    );
  }
}
