import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:bookia/core/widgets/dialogs.dart';
import 'package:bookia/features/details/widgets/add_to_wishlist/cubit/add_to_wishlist_cubit.dart';
import 'package:bookia/features/details/widgets/add_to_wishlist/cubit/add_to_wishlist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToWishlistAction extends StatelessWidget {
  const AddToWishlistAction({super.key, required this.productId});
  final int productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishlistActionCubit(),
      child: BlocConsumer<WishlistActionCubit, WishlistActionState>(
        listener: (context, state) {
          if (state is WishlistActionSuccess) {
            pop(context);
            showMyDialog(context, state.message, DialogType.success);
          } else if (state is WishlistActionError) {
            pop(context);
            showMyDialog(context, state.error);
          } else if (state is WishlistActionLoading) {
            showLoadingDialog(context);
          }
        },
        builder: (context, state) {
          var cubit = context.read<WishlistActionCubit>();
          return IconButton(
            icon: CustomSvgPicture(
              path: AppImages.bookmarkSvg,
              color: cubit.isProductInWishlist(productId)
                  ? AppColors.primaryColor
                  : null,
            ),
            onPressed: () {
              if (cubit.isProductInWishlist(productId)) {
                context.read<WishlistActionCubit>().removeFromWishlist(
                  productId,
                );
              } else {
                context.read<WishlistActionCubit>().addToWishlist(productId);
              }
            },
          );
        },
      ),
    );
  }
}
