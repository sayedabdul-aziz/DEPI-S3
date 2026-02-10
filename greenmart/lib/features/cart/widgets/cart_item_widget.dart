import 'package:flutter/material.dart';
import 'package:greenmart/core/styles/text_styles.dart';
import 'package:greenmart/features/cart/widgets/item_cart_price.dart';
import 'package:greenmart/features/home/data/product_model.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key, required this.item});

  final ProductModel item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(item.image ?? '', width: 65),
        const SizedBox(width: 30),
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title ?? '',
                          style: TextStyles.subtitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item.quantityPerPrice ?? '',
                          style: TextStyles.caption1,
                        ),
                      ],
                    ),
                  ),

                  IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                ],
              ),
              const SizedBox(height: 10),
              ItemCartPrice(),
            ],
          ),
        ),
      ],
    );
  }
}
