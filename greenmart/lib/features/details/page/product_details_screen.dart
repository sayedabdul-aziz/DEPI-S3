import 'package:flutter/material.dart';
import 'package:greenmart/core/styles/app_colors.dart';
import 'package:greenmart/core/styles/text_styles.dart';
import 'package:greenmart/core/widgets/main_button.dart';
import 'package:greenmart/features/details/widgets/details_header.dart';
import 'package:greenmart/features/details/widgets/nutritions_tile.dart';
import 'package:greenmart/features/details/widgets/price_and_counter.dart';
import 'package:greenmart/features/details/widgets/reviews_tile.dart';
import 'package:greenmart/features/details/widgets/title_with_favorite.dart';
import 'package:greenmart/features/home/data/product_model.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.model});
  final ProductModel model;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                DetailsHeader(widget: widget),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleWithFavorite(widget: widget),
                      SizedBox(height: 30),
                      PriceAndCounter(),
                      SizedBox(height: 30),
                      Divider(),
                      ExpansionTile(
                        tilePadding: EdgeInsets.zero,
                        childrenPadding: EdgeInsets.zero,
                        title: Text(
                          'Description',
                          style: TextStyles.caption1.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        children: [
                          Text(
                            widget.model.description ?? '',
                            style: TextStyles.caption1.copyWith(
                              color: AppColors.greyColor,
                            ),
                          ),
                        ],
                      ),
                      Divider(height: 30),
                      NutritionsTile(),
                      Divider(height: 30),
                      ReviewsTile(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackButton(),
                  IconButton(onPressed: () {}, icon: Icon(Icons.share)),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
          top: 10,
        ),
        child: MainButton(text: 'Add to Cart', onPressed: () {}),
      ),
    );
  }
}
