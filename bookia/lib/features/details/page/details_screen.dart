import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/core/widgets/my_body_view.dart';
import 'package:bookia/features/home/data/models/best_seller_response/product.dart';
import 'package:bookia/features/home/presentation/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:readmore/readmore.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.book});
  final Product book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () => pop(context),
              child: CustomSvgPicture(path: AppImages.backSvg),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: CustomSvgPicture(path: AppImages.bookmarkSvg),
            onPressed: () {},
          ),
        ],
      ),
      body: _detailsBody(context),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(22, 10, 22, 22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('\$${book.price}', style: TextStyles.title),
            MainButton(
              minWidth: 200,
              bgColor: AppColors.darkColor,
              text: 'Add to cart',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailsBody(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: MyBodyView(
          child: Column(
            children: [
              Hero(
                tag: book.id ?? "",
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CustomCachedNetworkImage(
                    width: 200,
                    height: 300,
                    url: book.image ?? "",
                  ),
                ),
              ),
              Gap(20),
              Text(
                book.name ?? "",
                style: TextStyles.title,
                textAlign: TextAlign.center,
              ),
              Gap(10),
              Text(
                book.category ?? "",
                style: TextStyles.body.copyWith(color: AppColors.primaryColor),
              ),
              Gap(20),
              ReadMoreText(
                book.description ?? "",
                style: TextStyles.caption1.copyWith(
                  color: AppColors.darkGreyColor,
                ),
                trimLines: 4,
                colorClickableText: AppColors.primaryColor,
                trimMode: TrimMode.Line,
                textAlign: TextAlign.justify,
                trimCollapsedText: 'Show more',
                trimExpandedText: 'Show less',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
