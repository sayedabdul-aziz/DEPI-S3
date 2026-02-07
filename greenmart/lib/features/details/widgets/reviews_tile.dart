import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:greenmart/core/styles/app_colors.dart';
import 'package:greenmart/core/styles/text_styles.dart';

class ReviewsTile extends StatelessWidget {
  const ReviewsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Reviews',
          style: TextStyles.caption1.copyWith(fontWeight: FontWeight.w600),
        ),
        Spacer(),
        IgnorePointer(
          ignoring: true,
          child: RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            itemCount: 5,
            itemSize: 24,
            itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
            onRatingUpdate: (rating) {},
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
