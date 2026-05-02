import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/core/widgets/shimmer/custom_shimmer_widget.dart';
import 'package:bookia/features/home/data/models/best_seller_response/product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    super.key,
    required this.book,
    this.onRemove,
    this.onRefresh,
  });
  final Product book;
  final VoidCallback? onRemove;
  final VoidCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushTo(context, Routes.details, extra: book).then((value) {
          onRefresh?.call();
        });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Hero(
                tag: book.id ?? "",
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CustomCachedNetworkImage(url: book.image ?? ""),
                ),
              ),
            ),
            Gap(10),
            Text(
              book.name ?? "",
              style: TextStyles.subtitle2,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${book.priceAfterDiscount ?? book.price}',
                  style: TextStyles.body,
                ),
                onRemove != null
                    ? IconButton(
                        onPressed: onRemove,
                        icon: const Icon(Icons.close, size: 20),
                      )
                    : MainButton(
                        minWidth: 70,
                        minHeight: 30,
                        bgColor: AppColors.darkColor,
                        text: 'Buy',
                        onPressed: () {},
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    this.height = 100,
    this.width = double.infinity,
    required this.url,
    this.errorWidget,
    this.fit = BoxFit.cover,
    this.radius = 10,
  });

  final double height;
  final double width;
  final String url;
  final BoxFit fit;
  final Widget? errorWidget;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      fit: fit,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CustomShimmerWidget(
            width: width,
            height: height,
            borderRadius: radius,
          ),
      errorWidget: (context, url, error) => errorWidget ?? Icon(Icons.error),
    );
  }
}

// slivers
