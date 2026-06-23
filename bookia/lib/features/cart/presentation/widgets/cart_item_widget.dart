import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/features/cart/data/models/cart_response/cart_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.item,
    required this.onDelete,
    required this.onDecrement,
    required this.onIncrement,
  });

  final CartItem item;
  final VoidCallback onDelete;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: item.itemProductImage ?? '',
              height: 120,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const Gap(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                // title and delete button
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        item.itemProductName ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.body.copyWith(
                          color: AppColors.darkGreyColor,
                        ),
                      ),
                    ),
                    const Gap(10),
                    IconButton(icon: Icon(Icons.delete), onPressed: onDelete),
                  ],
                ),

                // price
                Text(
                  '\$${item.itemProductPriceAfterDiscount?.ceil()}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.subtitle2,
                ),

                const Gap(16),

                // counter
                Row(
                  spacing: 10,
                  children: [
                    GestureDetector(
                      onTap: onDecrement,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: AppColors.borderColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.remove),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                      child: Text(
                        item.itemQuantity.toString(),
                        style: TextStyles.body,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    GestureDetector(
                      onTap: onIncrement,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: AppColors.borderColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.add),
                      ),
                    ),
                    Spacer(),
                    Text(
                      '\$${item.itemTotal?.ceil()}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.subtitle2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
