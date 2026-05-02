import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:bookia/core/widgets/my_body_view.dart';
import 'package:bookia/core/widgets/shimmer/book_card_shimmer.dart';
import 'package:bookia/core/widgets/shimmer/shimmer_grid_view.dart';
import 'package:bookia/features/home/presentation/widgets/book_card.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wishlist')),
      body: MyBodyView(
        child: BlocBuilder<WishlistCubit, WishlistState>(
          builder: (context, state) {
            var books = context.read<WishlistCubit>().wishlist;
            if (state is! WishlistSuccessState) {
              return ShimmerGridView(
                itemCount: 6,
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                mainAxisExtent: 250,
                itemBuilder: (context, index) => BookCardShimmer(),
              );
            }

            if (books.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomSvgPicture(
                      path: AppImages.bookmarkSvg,
                      height: 100,
                      width: 100,
                      color: AppColors.darkGreyColor,
                    ),
                    Gap(20),
                    Text('Your wishlist is empty', style: TextStyles.body),
                  ],
                ),
              );
            }
            return GridView.builder(
              itemCount: books.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                mainAxisExtent: 250,
              ),
              itemBuilder: (context, index) => BookCard(
                book: books[index],
                onRemove: () {
                  context.read<WishlistCubit>().removeFromWishlist(
                    books[index].id!,
                  );
                },
                onRefresh: () {
                  context.read<WishlistCubit>().getWishlist();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
