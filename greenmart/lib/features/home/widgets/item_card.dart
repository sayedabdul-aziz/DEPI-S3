import 'package:flutter/material.dart';
import 'package:greenmart/core/functions/navigations.dart';
import 'package:greenmart/core/styles/app_colors.dart';
import 'package:greenmart/core/styles/text_styles.dart';
import 'package:greenmart/features/details/page/product_details_screen.dart';
import 'package:greenmart/features/home/data/product_model.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.model});

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushTo(context, ProductDetailsScreen(model: model));
      },
      child: Container(
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
            Expanded(
              child: Hero(
                tag: model.tag ?? '',
                child: Image.network(model.image ?? '', width: double.infinity),
              ),
            ),
            SizedBox(height: 16),
            Text(
              model.title ?? "",
              style: TextStyles.body.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 6),
            Text(
              model.quantityPerPrice ?? '',
              style: TextStyles.caption2.copyWith(color: AppColors.greyColor),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text(
                  '${model.price}',
                  style: TextStyles.body.copyWith(fontWeight: FontWeight.w600),
                ),
                Spacer(),
                SizedBox(
                  height: 38,
                  width: 38,
                  child: FloatingActionButton.small(
                    heroTag: UniqueKey(),
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
      ),
    );
  }
}
