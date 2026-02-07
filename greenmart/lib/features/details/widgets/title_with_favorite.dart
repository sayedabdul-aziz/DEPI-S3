import 'package:flutter/material.dart';
import 'package:greenmart/core/styles/app_colors.dart';
import 'package:greenmart/core/styles/text_styles.dart';
import 'package:greenmart/features/details/page/product_details_screen.dart';

class TitleWithFavorite extends StatelessWidget {
  const TitleWithFavorite({super.key, required this.widget});

  final ProductDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.model.title ?? '', style: TextStyles.subtitle),
            SizedBox(height: 8),
            Text(
              widget.model.quantityPerPrice ?? '',
              style: TextStyles.caption1.copyWith(color: AppColors.greyColor),
            ),
          ],
        ),
        GestureDetector(onTap: () {}, child: Icon(Icons.favorite_border)),
      ],
    );
  }
}
